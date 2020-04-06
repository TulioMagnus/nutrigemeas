# frozen_string_literal: true

class CreatePacients < ActiveRecord::Migration[6.0]
  def change
    create_table :pacients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :profession
      t.string :sex
      t.string :street
      t.integer :number
      t.string :state
      t.string :country
      t.string :city
      t.string :avatar
      t.string :cpf
      t.string :email
      t.text :obs
      t.string :phone
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
