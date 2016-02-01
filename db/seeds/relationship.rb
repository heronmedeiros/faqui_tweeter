users = User.all.shuffle
11.times do |t|
  user1  = users.sample
  user2 = users.sample

  f1 = users[8..-1]
  f2 = users[0..5]

  f1.collect do |followed|
    user1.follow(followed)
    user2.follow(followed)
  end
  f2.collect do |follower|
    follower.follow user1
    follower.follow user2
  end

end
