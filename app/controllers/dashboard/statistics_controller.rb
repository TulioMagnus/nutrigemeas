# frozen_string_literal: true

module Dashboard
  class StatisticsController < DashboardController
    def index
      @patient_male = Patient.all.where(gender: 'male').count
      @patient_female = Patient.all.where(gender: 'female').count
      @active_male = Patient.where(status_cd: :active, gender: 'male').count
      @active_female = Patient.where(status_cd: :active, gender: 'female').count
      @patients = Patient.all
    end
  end
end
