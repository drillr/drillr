class CreateUserAchievements < ActiveRecord::Migration
  def change
    create_table :user_achievements do |t|
      t.references :user, index: true, foreign_key: true
      t.references :achievement, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
