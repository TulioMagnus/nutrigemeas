# frozen_string_literal: true

module Dashboard
  class WelcomeController < DashboardController
    def index
      @count_patients = Patient.count
      @count_appointments = Appointment.count
      @total_earned = Appointment.where(payment_status: true).sum(:price_cents)
      @total_to_earn = Appointment.where(payment_status: false).sum(:price_cents)
      @appointments_per_month = Appointment.all.group_by_month(:appointment_date, last: 12, format: '%b %y').count
    end
  end
end
