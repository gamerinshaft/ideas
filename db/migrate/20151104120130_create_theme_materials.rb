class CreateThemeMaterials < ActiveRecord::Migration
  def change
    create_table :theme_materials do |t|
      t.integer :material_id
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
