  50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  password = "password"
  User.create!(name: name,
               email: email,
               face: open("./public/uploads/user/404.png"),
               password: password,
               password_confirmation: password,
               )
end

User.all.each do |user|
  title = Faker::Games::Pokemon.name
  content = Faker::Games::Pokemon.name
  user.pictures.create!(
    title: title,
    content: content,
    image: open("./public/uploads/picture/500.png"),
    user_id: user.id
  )
end
