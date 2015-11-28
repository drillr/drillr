class CreateDrills < ActiveRecord::Migration
  def change
    create_table :drills do |t|
      t.string :title
      t.text :description
      t.references :drill_group, index: true, foreign_key: true
      t.integer :base_points
      t.integer :skill_level
      t.text :hint

      t.timestamps null: false
    end
  end
end
