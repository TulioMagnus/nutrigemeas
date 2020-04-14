# frozen_string_literal: true

namespace :pacients do
  desc 'set pacient to active based on appointment_date'
  task set_status: :environment do
    Pacient.find_each do |pacient|
      pacient.update_column(:status, pacient.appointments
        .where('appointment_date > ?', 6.months.ago)
        .exists? ? 'active' : 'inactive')
    end
  end
end
