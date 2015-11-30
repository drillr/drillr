class Achievement < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :point_value, presence: true, numericality: { greater_than_or_equal_to: 0 }

  has_many :user_achievements, dependent: :destroy
  has_many :users, through: :user_achievements

  mount_uploader :badge, ImageUploader

  def point_value_display
    ActionController::Base.helpers.pluralize(point_value, "point")
  end
end
