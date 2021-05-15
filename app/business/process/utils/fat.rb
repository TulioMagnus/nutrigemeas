# frozen_string_literal: true

class Process::Utils::Fat
  def initialize(skin_fold, age)
    @data = skin_fold
    @age = age
  end

  def call
    Appointment.find_by(id: @data.appointment_id).update!(fat: calculate_fat.to_f.round(1))
  end

  def calculate_fat
    dc ||= Process::Utils::Density.new(@data, @age).call
    first_term = (4.95 / dc) - 4.5
    first_term * 100
  end
end
