# frozen_string_literal: true

module Dashboard
  class AlertsController < DashboardController
    def index
      @future_appointments = Appointment.where(appointment_date: Time.zone.today + 1..Time.zone.today + 7).count
      @future_appointments_hash = Appointment.where(appointment_date: Time.zone.today + 1..Time.zone.today + 7)
    end
  end
end
