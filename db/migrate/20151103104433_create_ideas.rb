class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :name
      t.text :content
      t.integer :theme_id

      t.timestamps null: false
    end
  end
end
