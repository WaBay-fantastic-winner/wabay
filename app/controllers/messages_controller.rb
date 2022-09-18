class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def create
    @project = Project.find(params[:project_id])
    @message = current_user.messages.new(params_message)
    @message.save!
    

  end

  private

  def params_message
    params.require(:message).permit(:content)
  end
end
