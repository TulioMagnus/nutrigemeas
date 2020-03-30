# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :pacient
  monetize :price_cents
end
