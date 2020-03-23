class CreatePacients < ActiveRecord::Migration[6.0]
  def change
    create_table :pacients do |t|
      t.string :first_name
      t.string :last_name
      t.date :birth_date
      t.string :sex
      t.string :street
      t.integer :number
      t.string :state
      t.string :country
      t.integer :cpf
      t.text :obs
      t.integer :phone

      t.timestamps
    end
  end
end
