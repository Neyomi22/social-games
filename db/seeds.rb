# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
users = %w(akash@gmail.com amanda@gmail.com ian@gmail.com lucy@gmail.com henry@gmail.com james@gmail.com donna@gmail.com)
password = '123456'
sports = %w(Footy Soccer Badminton Tennis)
# location = %w(Officer Watsonia Clyde)
location = ['14 Smethurst Street, Cranbourne, Victoria, Australia', '22 Technology Circuit, Hallam, Victoria, Australia', '13 Duerdin Street, Clayton, Victoria, Australia', '400 Cheltenham Road, Keysborough, Victoria, Australia', '450 Princes Highway, Noble Park, Victoria, Australia', '225 Warrigal Rd, Burwood, Victoria, Australia']
skill = %w(Basic Intermediate Advanced)
titles = ['Game On', 'Play And Win', 'Fun Game', 'Play Fair','Have Fun Playing', 'Boost Your Energy', 'Play For Fun', 'A Game To Cherish', 'Meet And Play', 'Best In The Game', 'No Pain, No Gain!', 'Get In The Game', 'Got Game?', 'Let the Game Begin',  'Power Play', 'Play for the Glory', 'Games People Play']
descriptions = ['Have fun playing.Be on time.', 'A friendly game. Want to have fun and socialise.', 'I can be competitive so bring your best game. Do not worry it will be fun.', 'Want to play a game with people who love the sport and also have fun.', 'No competition. Everyone is a winner', 'I hope everyone likes a good workout. A bit of competition is always good', 'Have fun playing a game which is good for your health', 'Let us have a good time burning calories.', 'Want to be competitive. This is the game for you.', 'Bring you best game. It will be fun', 'I play a fair game. Want to join and play a fun filled game.']



# Users
users.each do |user|
  User.create(email: user, password: password)
end

# Events
20.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: sports.sample,
    number_of_participants: rand(1..11),
    description: descriptions.sample,
    title: titles.sample,
    duration: rand(1..3),
    private: [nil, "superman"].sample,
    user_id: rand(1..7),
    location: location.sample
    # location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

# Bookings booking 20
20.times do
  event = Event.find(rand(1..20))
  user = [1,2,3,45,6,7].reject { |num| num == event.user_id}.sample
  Booking.create(user_id: user, event_id: event.id)
end
