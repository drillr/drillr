class Answer < ActiveRecord::Base
  belongs_to :drill
  belongs_to :user

  validates :body, presence: true
end
