class Drill < ActiveRecord::Base
  belongs_to  :drill_group
  has_many    :solutions, dependent: :destroy
  has_many    :answers

  # We can add multiple solutions at the same time as creating a drill object
  # Blank solutions will not be saved
  accepts_nested_attributes_for :solutions, reject_if: lambda {|a| a[:body].blank? }

  validates :title, presence: true
  validates :description, presence: true
  validates :base_points, presence: true
  validates :skill_level, presence: true
  validates :hint, presence: true
  validates :drill_group_id, presence: true

end
