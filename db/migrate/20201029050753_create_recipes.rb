class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :video, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
