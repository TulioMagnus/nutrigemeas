# frozen_string_literal: true

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

  let(:appointment) { subject.appoimtments.create(appointment_date: Time.now,
                                                  patient_id: id,
                                                  appointment_type: 'Consulta') }

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
