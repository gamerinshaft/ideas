class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.integer :a_material_id
      t.integer :b_material_id

      t.timestamps null: false
    end
  end
end
