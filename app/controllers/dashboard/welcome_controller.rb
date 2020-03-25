# frozen_string_literal: true

class Dashboard::WelcomeController < DashboardController
  def index
    @count_pacients = Pacient.count
  end
end
