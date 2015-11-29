class AnswersController < ApplicationController
  before_action :find_answer, only: [ :destroy]

  # adds CanCanCan authorization for all controller actions
  load_and_authorize_resource

  def create
    @drill = Drill.find params[:drill_id]
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.drill = @drill

    @user = current_user
    @solutions = @drill.solutions

    @solutions.each do |solution|
      if @answer.body == solution.body
        @match = true
        earned_points = @drill.base_points * @drill.skill_level
        original_points = @drill.base_points * @drill.skill_level
        if params[:answer][:used_hint]
          earned_points *= 0.5
          Rails.logger.info "Used hint, so user will earn #{earned_points} instead of #{original_points}"
        end


        @user.points = @user.points + earned_points

        achievements = Achievement.all

        user_achievements_array = []
        achievements.each do |achievement|
          if @user.points >= achievement.point_value
            user_achievements_array.push(achievement.id)
          end
          @user.achievement_ids = user_achievements_array
        end

        @user.save
      else
        @match = false
      end
    end

    if @match == true && @answer.save
      redirect_to drill_path(@drill), notice: "CORRECT....OOOOHHHH GOOD FOR YOU, DON'T GET COMFORTABLE!"
    else
        flash[:alert] = "WHAT WAS THAT PRIVATE!? WRONG!!! DROP DOWN....GIVE ME 20....AND TRY AGAIN!"
        render "/drills/show"
    end
  end

  def destroy
    @answer.destroy

    redirect_to drill_path(@answer.drill), alert: "Answer Deleted!"
  end

  def answer_params
    params.require(:answer).permit([:body, :drill_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

end
