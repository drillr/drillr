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

        # add to training plan
        selected_drill = UserDrill.where(user: @user, drill: @drill).first
        # byebug
        if !selected_drill.present?
          Rails.logger.info "The user has not added this drill yet, so adding it for them and marking it complete..."
          selected_drill = UserDrill.new
          selected_drill.user = @user
          selected_drill.drill = @drill
        end
        selected_drill.completed = true
        selected_drill.save


        achievements = Achievement.all

        current_achievements_array = @user.achievement_ids
        @new_achievement_array = []

        achievements.each do |achievement|
          if @user.points >= achievement.point_value && !current_achievements_array.include?(achievement.id)
            @new_achievement_array.push(achievement.id)
          end
          @user.achievement_ids = current_achievements_array + @new_achievement_array
        end

        @user.save
      else
        @match = false
      end
    end

    if @match == true && @answer.save
      session[:new_achievement_ids] = @new_achievement_array
      flash[:drill_notice] = "CORRECT....OOOOHHHH GOOD FOR YOU, DO NOT GET COMFORTABLE!!!"
      redirect_to drill_path(@drill)
    else
        flash[:drill_alert] = "WHAT WAS THAT PRIVATE!? WRONG!!! DROP DOWN....GIVE ME 20....AND TRY AGAIN!"
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
