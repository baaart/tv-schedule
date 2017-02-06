10.times do
  category = Category.create({name: Faker::Name.name})
  show = Show.create({ name: Faker::Book.title, category: category })
  channel = Channel.create({ name: Faker::Name.name })
  schedule = Schedule.create({ channel: channel, show: show,
                               start_time: Faker::Time.between(DateTime.now - 1, DateTime.now),
                               end_time: Faker::Time.between(DateTime.now - 1, DateTime.now)
                            })
end
