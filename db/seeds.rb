# frozen_string_literal: true

if Rails.env.development?
  User.create(email: 'tuliokpmagnus@gmail.com', first_name: 'Túlio', last_name: 'Magnus', password: '123456', password_confirmation: '123456', avatar: Faker::Avatar.image)
  User.create(email: 'brunagalcarde@gmail.com', first_name: 'Bruna', last_name: 'Alcarde', password: '123456', password_confirmation: '123456', avatar: Faker::Avatar.image)
  User.create(email: 'carolinagalcarde@gmail.com', first_name: 'Carolina', last_name: 'Alcarde', password: '123456', password_confirmation: '123456', avatar: Faker::Avatar.image)
end
if Rails.env.development?

  user = User.create(email: 'tulio.magnus@gmail.com', first_name: 'tulio', last_name: 'magnus', password: '123456', password_confirmation: '123456', avatar: Faker::Avatar.image)
  50.times do
    FactoryBot.create(:patient, user: user)
  end
end
