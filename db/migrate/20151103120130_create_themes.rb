class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.integer :idea_id
      t.integer :material_id

      t.timestamps null: false
    end
  end
end
