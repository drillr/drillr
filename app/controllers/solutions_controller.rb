class SolutionsController < ApplicationController

  # adds CanCanCan authorization for all controller actions
  load_and_authorize_resource

  def destroy
    @solution = Solution.find(params[:id])
    @solution.destroy

    redirect_to drill_path(@solution.drill), alert: "Solution Deleted!"
  end

end
