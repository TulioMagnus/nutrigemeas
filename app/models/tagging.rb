# frozen_string_literal: true

class Tagging < ApplicationRecord
  belongs_to :patient
  belongs_to :tag
end
