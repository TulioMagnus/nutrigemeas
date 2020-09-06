# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.references :patient, null: false, foreign_key: true
      t.string :appointment_type_cd
      t.decimal :price, default: 0
      t.string :payment_status_cd, default: 'yes'

      t.timestamps
    end
  end
end
