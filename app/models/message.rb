class Message < ApplicationRecord
  after_create :create_notifications
 
  belongs_to :chatroom 
  belongs_to :user

   private

  def recipients
    # Up to your own implementation
    self.chatroom.event.users.where.not(id: self.user.id)
  end

  def create_notifications
    recipients.each do |recipient|
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

end
