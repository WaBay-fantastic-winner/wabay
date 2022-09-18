class MessagesController < ApplicationController
  def index
    @project = Project.find(params[:project_id])
    @messages = @project.messages
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(params_message)
    @message.save!
    ActionCable.server.broadcast('message_channel', { message: @message }) 
  end

  private

  def params_message
    params.require(:message).permit(:content, :project_id)
  end
end
