class AddBadgeToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :badge, :string
  end
end
