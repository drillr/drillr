class AnswersController < ApplicationController
  before_action :find_answer, only: [ :destroy]

  # adds CanCanCan authorization for all controller actions
  load_and_authorize_resource

  def create
    @drill = Drill.find params[:drill_id]

    answer_params
    @answer = Answer.new(answer_params)

    @answer.user = current_user

    if @answer.save
      redirect_to(drill_path(@answer.drill), notice: "Answer Created!")
    else
      render :new
    end
  end

  def destroy
    @answer.destroy

    redirect_to(drill_path(@answer.drill), alert: "Drill Group Deleted!"
  end

  def answer_params
    params.require(:answer).permit([:body, :drill_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

end