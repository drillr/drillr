class SelectedDrillsController < ApplicationController
  before_action :authenticate_user

  def create
    selected_drill = SelectedDrill.new
    drill = Drill.find params[:drill_id]
    selected_drill.drill = drill
    selected_drill.user = current_user
    if selected_drill.save
      redirect_to drill_path(drill), notice: "Drill has been added."
    else
      redirect_to drill_path(drill), alert: "Drill has already been added."
    end
  end

  def destroy
    drill = Drill.find params[:drill_id]
    selected_drill = current_user.selected_drills.find params[:id]
    selected_drill.destroy
    redirect_to drill_path(drill), notice: "Drill has been removed."
  end

end
