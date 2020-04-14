# frozen_string_literal: true

namespace :patients do
  desc 'set patient to active based on appointment_date'
  task set_status: :environment do
    Pacient.find_each do |patient|
      patient.update_column(:status, patient.appointments
        .where('appointment_date > ?', 6.months.ago)
        .exists? ? 'active' : 'inactive')
    end
  end
end
