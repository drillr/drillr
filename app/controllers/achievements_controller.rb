class AchievementsController < ApplicationController
  before_action :find_achievement, only: [:show, :edit, :update, :destroy]

  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achievement.new(achievement_params)
    if @achievement.save
      redirect_to achievements_path
    else
      render :new
    end
  end

  def index
    @achievements = Achievement.all
  end

  def show
  end

  def edit
  end

  def update
    @achievement.update(achievement_params)

    if @achievement.save
      redirect_to @achievement, notice: "Achievement updated."
    else
      render :edit
    end
  end

  def destroy
    if @achievement.destroy
      redirect_to achievements_path, notice: "Achievement deleted."
    else
      render text: "error destroying achievement"
    end
  end

  private
  def find_achievement
    @achievement = Achievement.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:name, :description, :point_value)
  end

end
