# json.array! @notifications do |notificaiton|
#     json.recipient notification.recipient
#     json.actor notification.actor
#     json.action notificaiton.action
#     json.notifiable do  
#         json.type 'a #{notication.notifiable.class.to_s.underscore.humanize.downcase}'
#     end
#     #missing file path for notifications

# end