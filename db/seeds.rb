users = %w(akash@gmail.com amanda@gmail.com ian@gmail.com)
password = '123456'
sports = %w(Footy Soccer Badminton Tennis Chess)
location = %w(Officer Watsonia Clyde)
skill = %w(Basic Intermediate Advanced)

# Users
users.each do |user|
  User.create(email: user, password: password)
end

# Events
20.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: sport.sample,
    number_of_participants: rand(1..11),
    description: Faker::Lorem.paragraph,
    title: Faker::Music.album,
    duration: rand(1..3),
    private: [nil, "superman"].sample,
    user_id: rand(1..3)
    location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

# Bookings booking 20
20.times do
  event = Event.find(rand(1..20))
  user = [1,2,3].reject { |num| num == event.user_id}.sample
  Booking.create(user_id: user.id, event_id: event.id)
end