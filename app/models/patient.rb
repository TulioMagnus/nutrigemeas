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
class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  validates_presence_of %w[first_name last_name birth_date user]
  paginates_per 12
  mount_uploader :avatar, AvatarUploader
  after_create :set_patient_status, :create_appointment
  enum status: {
    active: 0,
    inactive: 1,
    pending: 2
  }

  def create_appointment
    Appointment.create!(appointment_date: Time.zone.now, patient_id: id, appointment_type: :appointment)
  end

  def set_patient_status
    pending!
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  ransacker :full_name do |parent|
    Arel::Nodes::InfixOperation.new(
      '||',
      Arel::Nodes::InfixOperation.new(
        '||',
        parent.table[:first_name], Arel::Nodes.build_quoted(' ')
      ),
      parent.table[:last_name]
    )
  end

  def age
    now = Time.zone.now
    dob = birth_date
    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end

  def self.average_male
    male = where(gender: 'male')
    return 0 if male.count.zero?

    male.sum(&:age) / male.count
  end

  def self.average_female
    female = where(gender: 'female')
    return 0 if female.count.zero?

    female.sum(&:age) / female.count
  end
end
