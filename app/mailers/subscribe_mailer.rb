# frozen_string_literal: true

class SubscribeMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscribe_mail_mailer.notify.subject
  #
  def notify
    @greeting = 'sideque is working!'
    mail to: 'wl02599509@gmail.com', subject: 'Subscribe '
  end
end
