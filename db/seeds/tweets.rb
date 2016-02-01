us = User.take(3)
5.times do
  tweet = Faker::Hacker.say_something_smart
  us.each { |user| user.tweets.create!(body: tweet) }
end
