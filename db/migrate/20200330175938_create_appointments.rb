# frozen_string_literal: true

class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.date :appointment_date
      t.references :pacient, null: false, foreign_key: true
      t.string :appointment_type
      t.integer :price_cents, default: 0
      t.boolean :payment_status, default: false

      t.timestamps
    end
  end
end
