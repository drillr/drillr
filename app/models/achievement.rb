class Achievement < ActiveRecord::Base
  validates :name, presence: true
  validates :description, presence: true
  validates :point_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
