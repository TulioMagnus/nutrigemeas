FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { %w[M F].sample }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    user { User.all.sample }
    email { Faker::Internet.email }
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    city { Faker::Address.city }
    state { Faker::Address.state }
    country { Faker::Address.country }
    phone { Faker::PhoneNumber.cell_phone }
    obs { Faker::Hipster.paragraph }
    profession { Faker::Job.title }
  end
end