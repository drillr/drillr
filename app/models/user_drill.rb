class UserDrill < ActiveRecord::Base
  belongs_to :user
  belongs_to :drill

  validates :drill_id, uniqueness: {scope: :user_id}
end
