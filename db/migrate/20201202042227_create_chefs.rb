class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.text :cook, null: false

      t.references :recipe, foreign_key: true
      t.timestamps
    end
  end
end
