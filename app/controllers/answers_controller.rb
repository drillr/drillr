class AnswersController < ApplicationController
  before_action :find_answer, only: [ :destroy]

  # adds CanCanCan authorization for all controller actions
  load_and_authorize_resource

  def create
    @drill = Drill.find params[:drill_id]
    @answer = Answer.new(answer_params)
    @answer.user = current_user
    @answer.drill = @drill

    @solutions = @drill.solutions

    @solutions.each do |solution|
      if @answer.body == solution.body
        @match = true
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
