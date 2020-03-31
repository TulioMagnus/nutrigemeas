# frozen_string_literal: true

class Pacient < ApplicationRecord
  belongs_to :user
  validates_presence_of %w[first_name last_name birth_date]
  paginates_per 12
  mount_uploader :avatar, AvatarUploader

  def age
    now = Time.current
    dob = birth_date
    now.year - dob.year - (now.month > dob.month || (now.month == dob.month && now.day >= dob.day) ? 0 : 1)
  end
end
