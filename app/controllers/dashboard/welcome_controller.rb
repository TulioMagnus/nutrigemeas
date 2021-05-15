# frozen_string_literal: true

module Dashboard
  class WelcomeController < DashboardController
    def index
      @count_patients = Patient.count
      @count_appointments = Appointment.count
      @total_earned = Appointment.yes.sum(:price)
      @total_to_earn = Appointment.nos.sum(:price)
      @appointments_per_month = Appointment.all.group_by_month(:appointment_date, last: 12, format: '%b %y').count
      @earned_per_month = Appointment.yes.group_by_month(:appointment_date, last: 12, format: '%b %y').sum(:price)
    end
  end
end
