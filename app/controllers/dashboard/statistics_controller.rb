# frozen_string_literal: true

class Dashboard::StatisticsController < DashboardController
  def index
    @pacient_male = Pacient.all.where(sex: 'Homem').count
    @pacient_female = Pacient.all.where(sex: 'Mulher').count
    @pacients = Pacient.all
  end
end
