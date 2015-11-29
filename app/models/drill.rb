class Drill < ActiveRecord::Base
  belongs_to  :drill_group
  has_many    :solutions, dependent: :destroy
  has_many    :answers


  # We can add multiple solutions at the same time as creating a drill object
  # Blank solutions will not be saved
  accepts_nested_attributes_for :solutions, reject_if: lambda {|a| a[:body].blank? }

  has_many    :user_drills, dependent: :destroy
  has_many    :selecting_users, through: :user_drills, source: :user


  validates :title, presence: true
  validates :description, presence: true
  validates :base_points, presence: true
  validates :skill_level, presence: true
  validates :hint, presence: true
  validates :drill_group_id, presence: true

  def selected_drill_by?(user)
    user_drill_for(user).present?
  end

  def user_drill_for(user)
    user_drills.find_by_user_id(user.id)
  end

end
