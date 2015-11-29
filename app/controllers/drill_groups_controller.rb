class DrillGroupsController < ApplicationController

  before_action :find_drill_group, only: [:show, :edit, :update, :destroy]

  def new
    @drill_group = DrillGroup.new
  end

  def create
    drill_group_params
    @drill_group = DrillGroup.new(drill_group_params)

    if @drill_group.save
      redirect_to(category_drill_group_path(@drill_group.category, @drill_group), notice: "Drill Group Created!")
    else
      render :new
    end
  end


  def show

  end


  def edit

  end

  def update
    drill_group_params

    if @drill_group.update(drill_group_params)
      redirect_to(category_drill_group_path(@drill_group.category, @drill_group), notice: "Drill Group Created!")
    else
      render :edit
    end
  end

  def destroy
    @drill_group.destroy

    redirect_to category_path(@drill_group.category), alert: "Drill Group deleted!"
  end


  def drill_group_params
    params.require(:drill_group).permit([:name, :description, :category_id])
  end

  def find_drill_group
    @drill_group = DrillGroup.find(params[:id])
  end

end
