class CreateConsultations < ActiveRecord::Migration[6.0]
  def change
    create_table :consultations do |t|
      t.date :consultation_date
      t.references :pacient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
