class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :video, null: false
      t.string :title, null: false
      t.text :text, null: false

      t.text :vegetable_1, null: false
      t.text :vegetable_2
      t.text :vegetable_3
      t.text :vegetable_4
      t.text :vegetable_5
      t.text :vegetable_6
      t.text :vegetable_7
      t.text :vegetable_8
      t.text :vegetable_9
      t.text :vegetable_10

      t.text :cook_1, null: false
      t.text :cook_2
      t.text :cook_3
      t.text :cook_4
      t.text :cook_5
      t.text :cook_6
      t.text :cook_7
      t.text :cook_8
      t.text :cook_9
      t.text :cook_10

      t.text :food_1, null: false
      t.text :food_2
      t.text :food_3
      t.text :food_4
      t.text :food_5
      t.text :food_6
      t.text :food_7
      t.text :food_8
      t.text :food_9
      t.text :food_10

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
