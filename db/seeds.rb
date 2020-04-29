  50.times do |n|
  name = Faker::Games::Pokemon.name
  email = Faker::Internet.email
  face = Faker::Avatar.image
  password = "password"
  User.create!(name: name,
               email: email,
               face: face,
               password: password,
               password_confirmation: password,
               )
end

User.all.each do |user|
  title = Faker::Games::Pokemon.title
  content = Faker::Name.content
  image = Faker::Avatar.image
  user.pictures.create!(
    title: title,
    content: content,
    image: image,
    user_id: user.id
  )
end
