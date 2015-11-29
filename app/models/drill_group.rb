class DrillGroup < ActiveRecord::Base
  belongs_to :category

  has_many :drills, dependent: :destroy

  validates :name, presence: true
  #validates :description, presence: true
  validates :category, presence: true
end
