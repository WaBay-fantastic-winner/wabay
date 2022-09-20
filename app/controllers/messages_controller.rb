class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @messages = @project.messages
    @message = Message.new
  end

  def create
    @message = current_user.messages.new(params_message)
    @message.save!
    @project = Project.find(params[:project_id])
    p '-'*100
    p @project
    p '-'*100

    # ActionCable.server.broadcast('message_channel', { message: @message }) 
    SendMessageJob.perform_now(@message, @project)
  end

  private

  def params_message
    params.require(:message).permit(:content, :project_id, :user_id)
  end
end
