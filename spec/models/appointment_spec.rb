# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject do
    described_class.new(
      appointment_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      appointment_type: %w[Consulta Retorno].sample,
      pacient: Pacient.all.sample
    )
  end

  describe 'Associations' do
    it { should belong_to(:pacient) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:appointment_date) }
    it { is_expected.to validate_presence_of(:appointment_type) }
    it { should validate_presence_of(:pacient) }
  end
end
