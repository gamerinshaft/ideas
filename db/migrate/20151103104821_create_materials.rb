class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.string :name
      t.references :idea, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
