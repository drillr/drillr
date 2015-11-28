class CreateTrainingPlans < ActiveRecord::Migration
  def change
    create_table :training_plans do |t|
      t.references :user, index: true, foreign_key: true
      t.references :drill, index: true, foreign_key: true
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
