class Solution < ActiveRecord::Base
  belongs_to :drill

  validates :body, presence: true
end
