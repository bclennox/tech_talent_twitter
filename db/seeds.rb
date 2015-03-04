User.destroy_all

5.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    location: Faker::Address.city,
    handle: Faker::Internet.user_name,
    password: 'supersecret',
    password_confirmation: 'supersecret'
  )
end

100.times do
  user = User.all.sample
  user.tweets.create(body: Faker::Hacker.say_something_smart)
end
