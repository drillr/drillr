class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.references :drill, index: true, foreign_key: true
      t.text :body
      t.string :match_type

      t.timestamps null: false
    end
  end
end
