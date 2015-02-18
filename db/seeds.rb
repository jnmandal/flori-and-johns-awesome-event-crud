user1 = User.create(username: "jnmandal", password: "password")
user2 = User.create(username: "fgv02009", password: "password")

50.times do
  User.create( username: Faker::Internet.user_name, password: "password")
end

users = User.all
hosts = users.sample(15)

hosts.each do |host|
  Event.create(title: Faker::Lorem.word, description: Faker::Lorem.paragraph, date: Faker::Date.forward(30), location: Faker::Address.city, host: host)
end

events = Event.all

until Attendance.all.size == 100 do
  attendant = Attendance.create(user: users.sample, event: events.sample)
end
