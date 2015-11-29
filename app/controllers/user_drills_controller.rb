class UserDrillsController < ApplicationController
  load_and_authorize_resource
  
  def create
    user_drill = UserDrill.new
    drill = Drill.find params[:drill_id]
    user_drill.drill = drill
    user_drill.user = current_user
    if user_drill.save
      redirect_to drill_path(drill), notice: "Drill has been added."
    else
      redirect_to drill_path(drill), alert: "Drill has already been added."
    end
  end

  def destroy
    drill = Drill.find params[:drill_id]
    user_drill = current_user.user_drills.find params[:id]
    user_drill.destroy
    redirect_to drill_path(drill), notice: "Drill has been removed."
  end

end
