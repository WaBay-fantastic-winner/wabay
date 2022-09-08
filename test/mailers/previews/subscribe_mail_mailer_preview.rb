# Preview all emails at http://localhost:3000/rails/mailers/subscribe_mail_mailer
class SubscribeMailMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscribe_mail_mailer/notify
  def notify
    SubscribeMailMailer.notify
  end

end
