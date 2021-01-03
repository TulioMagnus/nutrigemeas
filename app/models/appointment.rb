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
class Appointment < ApplicationRecord
  belongs_to :patient
  has_one :skin_fold
  paginates_per 5
  validates_presence_of %w[appointment_date appointment_type patient]
  money_field :price
  after_create :create_skin_fold
  accepts_nested_attributes_for :skin_fold, allow_destroy: true

  def create_skin_fold
    SkinFold.create!(fold1: 0, fold2: 0, fold3: 0, fold4: 0, fold5: 0, fold6: 0, fold7: 0, appointment_id: id)
  end

  translate_enum :appointment_type
  translate_enum :payment_status

  amoeba do
    enable
  end

  APPOINTMENT_TYPE = %i[appointment return].freeze
  as_enum :appointment_type, APPOINTMENT_TYPE, map: :string

  PAYMENT_STATUS = %i[yes no].freeze
  as_enum :payment_status, PAYMENT_STATUS, map: :string

  def age_on_appointment
    ad = appointment_date
    dob = patient.birth_date
    ad.year - dob.year - (ad.month > dob.month || (ad.month == dob.month && ad.day >= dob.day) ? 0 : 1)
  end
end
