# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id         :bigint           not null, primary key
#  avatar     :string
#  birth_date :date
#  city       :string
#  country    :string
#  cpf        :string
#  email      :string
#  first_name :string
#  gender     :string
#  last_name  :string
#  number     :integer
#  obs        :text
#  phone      :string
#  profession :string
#  state      :string
#  status     :integer
#  street     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :patient do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    birth_date { Faker::Date.birthday(min_age: 18, max_age: 65) }
    gender { %w[m f].sample }
    cpf { Faker::IDNumber.brazilian_citizen_number }
    user { user.all.sample }
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
