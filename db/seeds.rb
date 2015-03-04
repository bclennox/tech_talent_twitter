User.destroy_all

me = User.create(
  first_name: 'Brandan',
  last_name: 'Lennox',
  email: 'bclennox@gmail.com',
  location: 'Raleigh, NC',
  handle: 'bclennox',
  password: 'supersecret',
  password_confirmation: 'supersecret'
)

100.times do
  me.tweets.create(body: Faker::Hacker.say_something_smart)
end
