# frozen_string_literal: true

module Dashboard
  class StatisticsController < DashboardController
    def index
      @patient_male = Patient.all.where(gender: 'Homem').count
      @patient_female = Patient.all.where(gender: 'Mulher').count
      @active_male = Patient.where(status: :active, gender: 'Homem').count
      @active_female = Patient.where(status: :active, gender: 'Mulher').count
      @patients = Patient.all
    end
  end
end
