11.times do |t|
  name  = Faker::Name.name
  email = "name-#{t+12}@email.com"
  pass = "pa$$$$ap"
  User.create!(name:                 name.strip,
              email:                 email,
              password:              pass,
              password_confirmation: pass)
end
