class Category < ActiveRecord::Base

  has_many :drill_groups, dependent: :destroy

  validates :name, presence: true, uniqueness: true

end
