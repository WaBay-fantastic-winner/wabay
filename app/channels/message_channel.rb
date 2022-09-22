class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "message_channel_#{params[:project_id]}"
    # stream_from "message_channel"
    project = Project.find(params[:project_id])
    stream_for project
  end
end
