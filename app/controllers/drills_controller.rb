class DrillsController < ApplicationController

  before_action :find_drill, only: [:edit, :update, :show, :destroy]

  def new
    @drill = Drill.new
  end

  def create
    @drill = Drill.new(drill_params)
    if @drill.save
      redirect_to drill_path(@drill), notice: "You have successfully created a new drill."
    else
      render :new
    end
  end

  def edit
  end

  def update
    drill_params
    if @drill.update(drill_params)
      redirect_to drill_path(@drill), notice: "You have successfully updated this drill."
    else
      render :edit
    end
  end

  def index

  end

  def show

  end

  def destroy
    drill_group = @drill.drill_group
    @drill.destroy
    redirect_to category_drill_group_path(drill_group.category, drill_group), notice: "You have successfully deleted the selected drill."
  end



private

  def drill_params
    params.require(:drill).permit(:title, :description, :base_points, :skill_level, :drill_group_id, :hint)
  end

  def find_drill
    @drill = Drill.find params[:id]
  end

end
