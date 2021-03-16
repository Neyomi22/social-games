class Message < ApplicationRecord
  after_create :create_notifications
 
  belongs_to :chatroom 
  belongs_to :user

   private

  def recipients
    # Up to your own implementation
    self.chatroom.event.users.where.not(id: self.user.id)
  end

  def event_owner
    self.chatroom.event.user
  end

  def create_notifications
    recipients.each do |recipient|
      add_notification(recipient)
    end
    add_notification(event_owner)
  end

  private
  def add_notification(recipient)
    notification = Notification.new(recipient: recipient, actor: self.user,
      action: 'messaged', notifiable: self)
    if notification.save
      puts "BROADCASTING MESSAGE"
      ActionCable.server.broadcast(
        "notifications:#{notification.recipient_id}",
        html: ApplicationController.new.render_to_string(partial: 'notifications/notification', locals: {notification: notification}))
    end
  end

end
