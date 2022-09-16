# frozen_string_literal: true

class MailWorkerJob < ApplicationJob
  queue_as :default
  def perform(follower, project_title)
    FundraisingAchieveMailer.notify(follower, project_title).deliver
  end
end
