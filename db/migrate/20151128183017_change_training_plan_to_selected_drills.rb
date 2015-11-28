class ChangeTrainingPlanToSelectedDrills < ActiveRecord::Migration
  def self.up
    rename_table :training_plans, :selected_drills
  end

  def self.down
    rename_table :selected_drills, :training_plans
  end
end
