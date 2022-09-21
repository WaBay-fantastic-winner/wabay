class MessageChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "message_channel_#{params[:project_id]}"
    # stream_from "message_channel"
    project = Project.find(params[:project_id])
    p '-'*100
    p project
    p '-'*100

    stream_for project
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
