# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
Merit::Badge.create!(
  id: 1,
  name: "THE JOINER",
  description: "HOORAY!!! You joined your first event",
  custom_fields: { difficulty: :bronze, color: "blue", image_url: '/images/purple-part.png' }
)

Merit::Badge.create!(
  id: 2,
  name: "THE COMMITED",
  description: "GREAT! You booked your first event",
  custom_fields: { difficulty: :bronze, color: "blue", image_url: "images/purple-gold.png" }
)
Merit::Badge.create!(
  id:3,
  name:"5 Events",
  description: "AWESOME! You have created 5 events",
  custom_fields: { difficulty: :silver, color: "silver", image_url: "/images/purple-first.png" }
)
Merit::Badge.create!(
  id:4,
  name: "YOU STAR",
  description: "YOU STAR! You have attended 10 events",
  custom_fields: { difficulty: :gold, color: "gold", image_url: "/images/purple-gold.png" }
)
