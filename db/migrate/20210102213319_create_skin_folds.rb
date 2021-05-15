# frozen_string_literal: true

class CreateSkinFolds < ActiveRecord::Migration[6.0]
  def change
    create_table :skin_folds do |t|
      t.decimal :height, null: false, default: 0
      t.decimal :weight, null: false, default: 0
      t.decimal :fold1, null: false, default: 0
      t.decimal :fold2, null: false, default: 0
      t.decimal :fold3, null: false, default: 0
      t.decimal :fold4, null: false, default: 0
      t.decimal :fold5, null: false, default: 0
      t.decimal :fold6, null: false, default: 0
      t.decimal :fold7, null: false, default: 0
      t.decimal :measure1, null: false, default: 0
      t.decimal :measure2, null: false, default: 0
      t.decimal :measure3, null: false, default: 0
      t.decimal :measure4, null: false, default: 0
      t.decimal :measure5, null: false, default: 0
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
