# frozen_string_literal: true

module Dashboard
  class StatisticsController < DashboardController
    def index
      @pacient_male = Pacient.all.where(gender: 'Homem').count
      @pacient_female = Pacient.all.where(gender: 'Mulher').count
      @pacients = Pacient.all
    end
  end
end
