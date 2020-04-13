# frozen_string_literal: true

class Pacient < ApplicationRecord
  include TranslateEnum
  belongs_to :user
  has_many :appointments
  validates_presence_of %w[first_name last_name birth_date user]
  paginates_per 12
  mount_uploader :avatar, AvatarUploader
  as_enum :status, [:active, :inactive, :pending], pluralize_scopes: false
  translate_enum :status
  before_create :set_pacient_status

  def set_pacient_status
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
