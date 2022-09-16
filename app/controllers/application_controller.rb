# frozen_string_literal: true

class ApplicationController < ActionController::Base

  # project / transaction / controller shares
  def project_current_total(params)
    @sum = 0
    Transaction.where(project_id: params).each do |transaction|
      @sum += transaction.price
    end
    @sum
  end

  # project and transaction controller share
  def percentage_of_currency
    @percentage = ((@sum.to_f / @project.amount_target).round(2) * 100).to_i
  end

   # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :discription])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:username, :discription])
  # end
end
