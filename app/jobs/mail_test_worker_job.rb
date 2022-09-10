class MailTestWorkerJob < ApplicationJob
  queue_as :default

  def perform
    SubscribeMailer.notify.deliver
  end
end
