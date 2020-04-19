# frozen_string_literal: true

class CreateAnamneses < ActiveRecord::Migration[6.0]
  def change
    create_table :anamneses do |t|
      t.references :appointment, null: false, foreign_key: true, index: { unique: true }
      t.string :reason
      t.string :first_reason
      t.string :second_reason
      t.string :third_reason
      t.integer :fourth_reason
      t.string :health_situation
      t.string :drugs_and_supplements
      t.boolean :smoker
      t.boolean :alcohol
      t.string :alergies
      t.string :food_intolerance
      t.boolean :hair_loss
      t.string :beento_nutri
      t.string :bowel
      t.string :constipation
      t.string :water_consumption
      t.string :chewing
      t.string :sleep
      t.string :stress
      t.boolean :exercise
      t.string :exercise_type
      t.string :exercise_frequency
      t.string :exercise_duration
      t.integer :exercise_tired
      t.string :make_your_food
      t.string :eat_out
      t.string :can_eat
      t.string :cant_eat
      t.boolean :drink_soda
      t.boolean :drink_juice
      t.boolean :fried_food
      t.string :fried_frequency
      t.boolean :candy
      t.string :candy_frequency
      t.boolean :legumes_fruits_leaves
      t.boolean :oats

      t.timestamps
    end
  end
end
