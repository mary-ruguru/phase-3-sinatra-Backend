class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.integer :recipe_id
      t.string :recipe_name
      t.timestamps
    end
  end
end
