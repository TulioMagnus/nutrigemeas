# frozen_string_literal: true

class Pacient < ApplicationRecord
  belongs_to :user
  paginates_per 12
end
