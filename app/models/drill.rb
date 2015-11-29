class Drill < ActiveRecord::Base
  belongs_to  :drill_group
  has_many    :solutions
  has_many    :answers

  validates :title, presence: true
  validates :description, presence: true
  validates :base_points, presence: true
  validates :skill_level, presence: true
  validates :hint, presence: true
  validates :drill_group_id, presence: true

end
