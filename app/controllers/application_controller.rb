# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # project and transaction controller share
  def project_current_total(params)
    @sum = 0
    Transaction.where(project_id: params).each do |transaction|
      @sum += transaction.price
    end
    @sum
  end
end
