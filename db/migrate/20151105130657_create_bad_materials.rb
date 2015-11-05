class CreateBadMaterials < ActiveRecord::Migration
  def change
    create_table :bad_materials do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
