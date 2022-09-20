class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @project = Project.find(params[:project_id])
    @messages = @project.messages
    @message = Message.new
    has_donated?(@project, current_user)
  end

  def create
    @message = current_user.messages.new(params_message)
    @message.save!
    @project = Project.find(params[:project_id])
    p '-'*100
    p @project
    p '-'*100
    # redirect_to project_messages_path(@project.id)

    # ActionCable.server.broadcast('message_channel', { message: @message }) 
    SendMessageJob.perform_now(@message, @project)
  end

  private

  def params_message
    params.require(:message).permit(:content, :project_id, :user_id)
  end

  def has_donated?(project_id, user_id)
    @donated = Transaction.find_by(project_id: project_id, user_id: user_id).present?
  end
end
