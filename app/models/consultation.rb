# frozen_string_literal: true

class Consultation < ApplicationRecord
  belongs_to :pacient
  has_many :appointments
end
