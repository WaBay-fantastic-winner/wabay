class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(message)
    # mine = ApplicationController.render(
    #   partial: 'messages/message', 
    #   locals: { message: @message }
    # )

    # their = ApplicationController.render(
    #   partial: 'messages/message', 
    #   locals: { message: @message }
    # )

    message = ApplicationController.render( partial: 'messages/message', locals: { message: message} )

    # p '-'*50
    # p message
    # p '-'*50
    # ActionCable.server.broadcast "room_channel_#{@message.room_id}", mine: mine, their: their, message: message 
    ActionCable.server.broadcast("message_channel", { message: message }) 
  end
end
