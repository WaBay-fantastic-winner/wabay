class SubscribeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscribe_mail_mailer.notify.subject
  #
  def notify
    @greeting = "Hi"

    mail to: "wl02599509@gmail.com", subject: 'TEST!'
  end
end
