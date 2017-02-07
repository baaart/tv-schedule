channels = ['FOX', 'BBC', 'Cartoon Network', 'HBO', 'HBO2', 'TVN', 'TVN7',
            'VOX', 'TVP1', 'TVP2', 'TV POLONIA', 'KUCHNIA+', 'POLONIA 1']
           .map { |c| Channel.create(name: c) }

['comedy', 'horror', 'series', 'sci-fi', 'romance', 'news'].map { |c| Category.create(name: c) }

channels.each do |c|
  time = Date.today.beginning_of_day + rand(4..6).hour
  begin
    duration = [45, 60, 90, 120].sample.minutes
    category = Category.order('RANDOM()').first
    show = Show.create(name: FFaker::Movie.title,
                       description: FFaker::Lorem.sentence(3),
                       category: category)
    Schedule.create(channel: c, show: show,
                    start_time: time,
                    end_time: time + duration)
    time += duration
  end while time < Date.today.beginning_of_day + 22.hours
end
