class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  has_many :user_achievements, dependent: :destroy
  has_many :achievements, through: :user_achievements

  has_many :user_drills, dependent: :destroy
  has_many :selected_drills, through: :user_drills, source: :drill

  mount_uploader :avatar, ImageUploader

  def full_name
    "#{first_name} #{last_name}"
  end

  # TODO: refactor (this exists in Achievement as well)
  def points_display
    ActionController::Base.helpers.pluralize(points, "point")
  end

  def has_answered_drill?(drill)
    drill.answers.where(user: self).any?
  end

end
