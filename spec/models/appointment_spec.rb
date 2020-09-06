# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id                  :bigint           not null, primary key
#  appointment_date    :date
#  appointment_type_cd :string
#  payment_status_cd   :string           default("yes")
#  price               :decimal(, )      default(0.0)
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  patient_id          :bigint           not null
#
# Indexes
#
#  index_appointments_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
require 'rails_helper'

RSpec.describe Appointment, type: :model do
  subject do
    described_class.new(
      appointment_date: Faker::Date.birthday(min_age: 18, max_age: 65),
      appointment_type: %w[Consulta Retorno].sample,
      patient: Pacient.all.sample
    )
  end

  describe 'Associations' do
    it { should belong_to(:patient) }
  end

  describe 'Money' do
    it { should monetize(:price) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:appointment_date) }
    it { is_expected.to validate_presence_of(:appointment_type) }
    it { should validate_presence_of(:patient) }
  end
end
