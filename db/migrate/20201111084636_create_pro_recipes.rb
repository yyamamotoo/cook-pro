class CreateProRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :pro_recipes do |t|

      t.timestamps
    end
  end
end
