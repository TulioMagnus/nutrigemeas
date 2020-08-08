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

  amoeba do
    enable
  end
end
