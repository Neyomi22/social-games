# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# users = %w(akash@gmail.com amanda@gmail.com ian@gmail.com lucy@gmail.com henry@gmail.com james@gmail.com donna@gmail.com george@gmail.com allana@gmail.com julie@gmail.com sam@gmail.com sonya@gmail.com)
users = %w(amanda@gmail.com akash@gmail.com ian@gmail.com lucy@gmail.com)
password = '123456'
sports = %w(Basketball Badminton Tennis Netball)
# location = %w(Officer Watsonia Clyde)
location = ["22 Ashmore Ave, Narre Warren South VIC 3805", '11 Gleadell St, Richmond VIC 3121', '30 Aughtie Dr, Albert Park VIC 3206', ' 30 Aughtie Dr, Albert Park VIC 3206', ' 30 Aughtie Dr, Albert Park VIC 3206', '14 Smethurst Street, Cranbourne, Victoria, Australia', '109 Frankston Gardens Dr, Carrum Downs VIC 3201', '27 Dunblane Rd, Noble Park VIC 3174', '1642 Ferntree Gully Rd, Knoxfield VIC 3180', '22 Technology Circuit, Hallam, Victoria, Australia', '13 Duerdin Street, Clayton, Victoria, Australia', '400 Cheltenham Road, Keysborough, Victoria, Australia', '450 Princes Highway, Noble Park, Victoria, Australia', '225 Warrigal Rd, Burwood, Victoria, Australia']
skill = %w(Basic Intermediate Advanced)
titles_tennis = ['Game On', 'Play And Win', 'Fun Game', 'Play Fair','Have Fun Playing', 'Boost Your Energy', 'Play For Fun', 'A Game To Cherish', 'Meet And Play', 'Best In The Game', 'No Pain, No Gain!', 'Get In The Game', 'Got Game?', 'Let the Game Begin',  'Power Play', 'Play for the Glory', 'Games People Play', '']
titles_badminton = ['Full of concentration and joy', 'Make your racket strings stronger', 'Smash me with your hot shot', 'Badminton, take it serious', 'Smash it and win it', 'Play with badminton Attitude', 'Keep calm and smash hard', 'Smash like a champion', 'Catch the shuttlecock','Serve it, smash it, win it, love it.', 'Are you fast enough to handle a badminton shuttle?']
titles_basketball = ['Addicted to Basketball', 'Aiming High, Basketball – not for the weak, Be prepared!', 'Believe in basketball', 'Championships are won at practice', 'Court is in session', 'Dunkzilla', 'Eat. Sleep. Hoop. Repeat', 'Elevate your Game', 'Everything is simple with Basketball', 'For the love of the game', 'Hustle, hit and never quit', 'Let the MADNESS begin!']
titles_netball = ['Quest for the Net', 'Take It To the Net', 'United we play. United we win', 'Victory is the goal', 'Netball the Game to Play', 'The Court is Ready!']
descriptions = ['Have fun playing.Be on time.', 'A friendly game. Want to have fun and socialise.', 'I can be competitive so bring your best game. Do not worry it will be fun.', 'Want to play a game with people who love the sport and also have fun.', 'No competition. Everyone is a winner', 'I hope everyone likes a good workout. A bit of competition is always good', 'Have fun playing a game which is good for your health', 'Let us have a good time burning calories.', 'Want to be competitive. This is the game for you.', 'Bring you best game. It will be fun', 'I play a fair game. Want to join and play a fun filled game.', 'Play a competitive game. Winning or losing does not matter. It is all for fun.', 'I want to play a quick game. It will be a good workout.']



# Users
users.each do |user|
  User.create(email: user, password: password)
end

# Events
9.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: "Badminton",
    number_of_participants: rand(1..5),
    description: descriptions.sample,
    title: titles_badminton.sample,
    duration: rand(1..2),
    skill_level: skill.sample,
    private: [nil, "superman"].sample,
    user_id: rand(2..4),
    location: location.sample
    # location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

9.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: "Tennis",
    number_of_participants: rand(1..5),
    description: descriptions.sample,
    title: titles_tennis.sample,
    duration: rand(1..2),
    skill_level: skill.sample,
    private: [nil, "superman"].sample,
    user_id: rand(2..4),
    location: location.sample
    # location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

9.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: "Basketball",
    number_of_participants: rand(1..9),
    description: descriptions.sample,
    title: titles_basketball.sample,
    duration: rand(1..3),
    skill_level: skill.sample,
    private: [nil, "superman"].sample,
    user_id: rand(2..4),
    location: location.sample
    # location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

6.times do 
  hash = {
    starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
    sport: "Netball",
    number_of_participants: rand(1..9),
    description: descriptions.sample,
    title: titles_netball.sample,
    duration: rand(1..3),
    skill_level: skill.sample,
    private: [nil, "superman"].sample,
    user_id: rand(2..4),
    location: location.sample
    # location: "#{location.sample}, Victoria, Australia"
  }
  Event.create(hash)
end

# 20.times do 
#   hash = {
#     starts_at: Faker::Time.forward(days: 10,  period: :evening, format: :long),
#     sport: sports.sample,
#     number_of_participants: rand(1..11),
#     description: descriptions.sample,
#     title: titles.sample,
#     duration: rand(1..3),
#     skill_level: skill.sample,
#     private: [nil, "superman"].sample,
#     user_id: rand(1..7),
#     location: location.sample
#     # location: "#{location.sample}, Victoria, Australia"
#   }
#   Event.create(hash)
# end

# Bookings booking 20
20.times do
  event = Event.find(rand(1..20))
  user = [2,3,4].reject { |num| num == event.user_id}.sample
  Booking.create(user_id: user, event_id: event.id)
end
