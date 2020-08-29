# frozen_string_literal: true

class CreateAnamneses < ActiveRecord::Migration[6.0]
  def change
    create_table :anamneses do |t|
      t.references :appointment, null: false, foreign_key: true, index: { unique: true }
      t.text :reason
      t.text :first_reason
      t.text :second_reason
      t.integer :third_reason
      t.integer :fourth_reason
      t.integer :brystol
      t.integer :urine
      t.text :health_situation
      t.text :drugs_and_supplements
      t.boolean :smoker
      t.boolean :alcohol
      t.text :alergies
      t.text :food_intolerance
      t.boolean :hair_loss
      t.text :beento_nutri
      t.text :bowel
      t.text :constipation
      t.text :water_consumption
      t.text :chewing
      t.text :sleep
      t.text :stress
      t.boolean :exercise
      t.text :exercise_type
      t.text :exercise_frequency
      t.text :exercise_duration
      t.integer :exercise_tired
      t.text :make_your_food
      t.text :eat_out
      t.text :can_eat
      t.text :cant_eat
      t.boolean :drink_soda
      t.boolean :drink_juice
      t.boolean :fried_food
      t.text :fried_frequency
      t.boolean :candy
      t.text :candy_frequency
      t.boolean :legumes_fruits_leaves
      t.boolean :oats

      t.timestamps
    end
  end
end
