# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :pacient
  monetize :price_cents
  paginates_per 4
  validates_presence_of %w[appointment_date appointment_type pacient]
end
