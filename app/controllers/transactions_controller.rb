# frozen_string_literal: true

class TransactionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: %i[create]
  before_action :authenticate_user!, except: %i[paid]
  include ProjectPriceSum

  def index
    @transactions = Transaction.all
  end

  def create
    # 建立交易紀錄（訂單）
    @transaction = Transaction.new(user_id: current_user.id,
                                   project_id: params['projectId'],
                                   donate_item_id:,
                                   price:)

    if @transaction.save
      find_project
      total = project_current_total(params['projectId']) + price
      @project.update(current_total: total)

      notify_achievement_to_followers(@project.id)

      # for ecpay action
      produce_ecpay_basic_params
      # 交易訂單成功寫入後，呼叫 Service 將完整參數包好。
      @ecpay_params = Payment::EcpayRequest.new(@merchant_trade_date,
                                                @merchant_trade_no,
                                                @item_name,
                                                @total_amount).perform
    else
      render :save_error
    end
  end

  def paid
    transaction = Transaction.find_by!(serial: params[:MerchantTradeNo])
    transaction.pay!

    current_donate_item = DonateItem.find(transaction.donate_item_id)
    current_donate_item.increment(:donate_logs_count).save

    sign_in(User.find(transaction.user_id))
    redirect_to project_path(transaction.project_id),
                notice: "感謝您贊助 #{DonateItem.find(transaction.donate_item_id).title} !"
  end

  def destroy
    @transaction = Transaction.find_by!(id: params[:id])
    @transaction.update(deleted_at: Time.now)
    redirect_to transactions_path, notice: '此筆交易已刪除...'
  end

  private

  def donate_item_id
    current_project = Project.find(params['projectId'])
    current_donate_item = DonateItem.find_by!(project_id: current_project, title: params['donateItemTitle']).id
  end

  def price
    params['additionalSum'].to_i
  end

  def find_project
    @project = Project.find(params['projectId'])
  end

  def produce_ecpay_basic_params
    @merchant_trade_no = @transaction.serial
    @merchant_trade_date = Time.now.strftime('%Y/%m/%d %H:%M:%S')
    @item_name = params['donateItemTitle']
    @total_amount = price
  end

  def followers_not_recepted_yet(project_id)
    @followers = Follow.where(followable_id: project_id, followable_type: 'Project', mail_sent: 'false')
  end

  def notify_achievement_to_followers(project_id)
    if percentage_of_currency(project_id) >= 100 && followers_not_recepted_yet(project_id).present? === true
      @followers.each do |follower|
        MailWorkerJob.perform_later(follower, Project.find(follower.followable_id).title)
        follower.update(:mail_sent => 'true')
      end
    end
  end
end