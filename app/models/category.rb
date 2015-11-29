class Category < ActiveRecord::Base

  has_many :drill_groups, dependent: :destroy



end
