class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message, project)
    # mine = ApplicationController.render(
    #   partial: 'messages/message', 
    #   locals: { message: @message }
    # )

    # their = ApplicationController.render(
    #   partial: 'messages/message', 
    #   locals: { message: @message }Z
    # )

    message = ApplicationController.render(partial: 'messages/message', locals: { message: message })

    MessageChannel.broadcast_to(project, message)
  end
end
