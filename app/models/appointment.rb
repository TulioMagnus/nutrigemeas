# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id               :bigint           not null, primary key
#  appointment_date :date
#  appointment_type :string
#  payment_status   :boolean          default(TRUE)
#  price_cents      :integer          default(0)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  patient_id       :bigint           not null
#
# Indexes
#
#  index_appointments_on_patient_id  (patient_id)
#
# Foreign Keys
#
#  fk_rails_...  (patient_id => patients.id)
#
class Appointment < ApplicationRecord
  belongs_to :patient
  has_one :anamnesis
  monetize :price_cents
  paginates_per 5
  validates_presence_of %w[appointment_date appointment_type patient]

  after_create :auto_create_anamnesis

  amoeba do
    enable
  end

  def age_on_appointment
    ad = appointment_date
    dob = patient.birth_date
    ad.year - dob.year - (ad.month > dob.month || (ad.month == dob.month && ad.day >= dob.day) ? 0 : 1)
  end

  def auto_create_anamnesis
    self.anamnesis = build_anamnesis
  end
end
