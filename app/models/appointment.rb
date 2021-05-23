# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id                    :bigint           not null, primary key
#  appointment_date      :date
#  appointment_status_cd :string           default("no")
#  appointment_type_cd   :string
#  density               :decimal(, )      default(0.0)
#  fat                   :decimal(, )      default(0.0)
#  mass                  :decimal(, )      default(0.0)
#  organs                :decimal(, )      default(0.0)
#  payment_status_cd     :string           default("yes")
#  plan_type_cd          :string
#  price                 :decimal(, )      default(0.0)
#  water                 :decimal(, )      default(0.0)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  patient_id            :bigint           not null
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
  has_one :skin_fold, dependent: :destroy
  paginates_per 5
  validates_presence_of %w[appointment_date appointment_type patient]
  money_field :price
  after_create :create_skin_fold
  accepts_nested_attributes_for :skin_fold, allow_destroy: true

  PLAN_TYPES = %i[basic balance freedom].freeze
  as_enum :plan_type, PLAN_TYPES, prefix: true, map: :string
  translate_enum :plan_type

  def create_skin_fold
    SkinFold.find_or_initialize_by(appointment_id: id)
  end

  amoeba do
    enable
  end

  APPOINTMENT_TYPE = %i[appointment return].freeze
  as_enum :appointment_type, APPOINTMENT_TYPE, map: :string
  translate_enum :appointment_type

  PAYMENT_STATUS = %i[yes no].freeze
  as_enum :payment_status, PAYMENT_STATUS, map: :string
  translate_enum :payment_status

  APPOINTMENT_STATUS = %i[yes no].freeze
  as_enum :appointment_status, APPOINTMENT_STATUS, map: :string
  translate_enum :appointment_status

  def age_on_appointment
    ad = appointment_date
    dob = patient.birth_date
    ad.year - dob.year - (ad.month > dob.month || (ad.month == dob.month && ad.day >= dob.day) ? 0 : 1)
  end
end
