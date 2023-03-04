class Recipes < ActiveRecord::Migration[6.1]
  def change
     create_table :recipes do |t|
      
      t.string :name
      t.string :image_url
      t.text :ingredient 
      t.string :cooking_time 
      t.timestamps
     end
  end
end
