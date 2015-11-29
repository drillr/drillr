class SolutionsController < ApplicationController

  before_action :find_solution, only: [ :edit, :update, :destroy]

  def new
    @solution = Solution.new
  end

  def create
    solution_params
    @solution = Solution.new(solution_params)

    if @solution.save
      redirect_to(drill_path(@solution.drill), notice: "Solution Created!")
    else
      render :new
    end
  end

  def edit

  end

  def update
    solution_params

    if @solution.update(solution_params)
      redirect_to(drill_path(@solution.drill), notice: "Solution Updated!")
    else
      render :edit
    end
  end

  def destroy
    @solution.destroy

    redirect_to(drill_path(@solution.drill), alert: "Drill Group deleted!"
  end


  def solution_params
    params.require(:solution).permit([:body, :drill_id])
  end

  def find_solution
    @solution = Solution.find(params[:id])
  end
end
