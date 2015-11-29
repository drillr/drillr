class SolutionsController < ApplicationController

  def new
    @solution = Solution.new
  end

  def create
    solution_params
    @solution = Solution.new(solution_params)

    if @solution.save
      redirect_to(category_solution_path(@solution.category, @solution), notice: "Drill Group Created!")
    else
      render :new
    end
  end

  def edit

  end

  def update
    solution_params

    if @solution.update(solution_params)
      redirect_to(category_solution_path(@solution.category, @solution), notice: "Drill Group Created!")
    else
      render :edit
    end
  end

  def destroy
    @solution.destroy

    redirect_to category_path(@solution.category), alert: "Drill Group deleted!"
  end


  def solution_params
    params.require(:solution).permit([:body, :drill_id])
  end

  def find_solution
    @solution = Solution.find(params[:id])
  end
end
