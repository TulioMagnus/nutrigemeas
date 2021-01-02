class CreateSkinFolds < ActiveRecord::Migration[6.0]
  def change
    create_table :skin_folds do |t|
      t.decimal :fold1
      t.decimal :fold2
      t.decimal :fold3
      t.decimal :fold4
      t.decimal :fold5
      t.decimal :fold6
      t.decimal :fold7
      t.references :appointment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
