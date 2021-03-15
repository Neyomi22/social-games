class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    puts "Successfully subscribed!!!"
    stream_from "notifications:#{params[:user_id]}"
  end

  def recieve(data)
    ActionCable.server.broadcast("notifications:#{current_user.id}", data)
  end
  

  # def unsubscribed
  #   # Any cleanup needed when channel is unsubscribed
  # end
end
  