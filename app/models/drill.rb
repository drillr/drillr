class Drill < ActiveRecord::Base
  belongs_to  :drill_group
  has_many    :solutions
  has_many    :answers
end
