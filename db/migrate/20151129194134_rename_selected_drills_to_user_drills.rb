class RenameSelectedDrillsToUserDrills < ActiveRecord::Migration
  def self.up
    rename_table :selected_drills, :user_drills
  end

  def self.down
    rename_table :user_drills, :selected_drills
  end
end
