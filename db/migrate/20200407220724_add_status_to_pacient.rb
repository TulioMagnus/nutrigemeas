# frozen_string_literal: true

class AddStatusToPacient < ActiveRecord::Migration[6.0]
  def change
    add_column :pacients, :status_cd, :integer
  end
end
