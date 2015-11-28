class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = Achivement.new(achievement_params)
    if @achievement.save
      redirect_to achievements_path
    else
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def achievement_params
    params.require(:achievement).permit(:name, :description, :point_value)
  end

end
