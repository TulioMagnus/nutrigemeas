# frozen_string_literal: true

module Dashboard
  class AlertsController < DashboardController
    def index
      @future_appointments = Appointment.days_7_future.count
      @future_appointments_hash = Appointment.days_7_future
      @past_appointments = Appointment.no.days_30_past.count
      @past_appointments_hash = Appointment.no.days_30_past
      @no_show_appointments = Appointment.no_show.days_30_past.count
      @no_show_appointments_hash = Appointment.no_show.days_30_past
    end
  end
end
