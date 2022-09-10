class MailWorkerJob < ApplicationJob
  queue_as :default

  def perform(project)
    FundraisingAchieveMailer.notify(project).deliver
  end
end
