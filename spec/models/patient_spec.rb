# frozen_string_literal: true

# == Schema Information
#
# Table name: patients
#
#  id           :bigint           not null, primary key
#  avatar       :string
#  birth_date   :date
#  city         :string
#  country      :string
#  cpf          :string
#  email        :string
#  first_name   :string
#  gender       :string
#  last_name    :string
#  number       :integer
#  obs          :text
#  phone        :string
#  plan_type_cd :string
#  profession   :string
#  state        :string
#  status_cd    :string
#  street       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  user_id      :bigint           not null
#
# Indexes
#
#  index_patients_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject do
    described_class.new(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      user: User.all.sample
    )
  end

  let(:appointment) do
    subject.appoimtments.create(appointment_date: Time.now,
                                patient_id: id,
                                appointment_type: 'Consulta')
  end

  describe 'Associations' do
    it { should belong_to(:user) }
  end

  describe 'Methods' do
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:birth_date) }
    it { should validate_presence_of(:user) }
  end
end
