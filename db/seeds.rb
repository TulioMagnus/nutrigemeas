# frozen_string_literal: true

if Rails.env.development?

  user = User.create(email: 'tulio.magnus@gmail.com', first_name: 'tulio', last_name: 'magnus', password: '123456', password_confirmation: '123456', avatar: Faker::Avatar.image)
  50.times do
    FactoryBot.create(:patient, user: user)
  end
end
