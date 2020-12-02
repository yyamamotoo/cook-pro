class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.text :vegetable, null: false
      t.text :amount, null: false

      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
