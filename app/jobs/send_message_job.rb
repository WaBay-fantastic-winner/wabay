class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message, project, current_user)
    if current_user
      message = ApplicationController.render(partial: 'messages/selfmessage', locals: { message: message })
    else
      message = ApplicationController.render(partial: 'messages/message', locals: { message: message })
    end  
    MessageChannel.broadcast_to(project, message)
  end
end
