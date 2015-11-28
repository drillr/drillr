class DrillGroup < ActiveRecord::Base
  belongs_to :category

  validates :name, presence: true
  validates :description, presence: true
end
