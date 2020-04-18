# frozen_string_literal: true

class Patient < ApplicationRecord
  belongs_to :user
  has_many :appointments
  has_many :taggings
  has_many :tags, through: :taggings
  validates_presence_of %w[first_name last_name birth_date user]
  paginates_per 12
  mount_uploader :avatar, AvatarUploader
  after_create :set_patient_status, :create_appointment
  enum status: {
    active: 0,
    inactive: 1,
    pending: 2
  }

  def self.tagged_with(name)
    Tag.find_by!(name: name).patients
  end

  def self.tag_counts
    Tag.select('tags.*, count(taggings.tag_id) as count').joins(:taggings).group('taggings.tag_id')
  end

  def tag_list
    tags.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.tags = names.split(',').map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end

  def create_appointment
    Appointment.create!(appointment_date: Time.now, patient_id: id, appointment_type: 'Consulta')
  end

  def set_patient_status
    pending!
  end

  def full_name
    [first_name, last_name].join(' ')
  end

  def age
    now = Time.zone.now
    dob = birth_date
    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end

  def self.average_male
    male = where(gender: 'Homem')
    male.sum(&:age) / male.count
  end

  def self.average_female
    female = where(gender: 'Mulher')
    female.sum(&:age) / female.count
  end
end
