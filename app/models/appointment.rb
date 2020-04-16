# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :patient
  monetize :price_cents
  paginates_per 5
  validates_presence_of %w[appointment_date appointment_type patient]

  amoeba do
    enable
  end
end
