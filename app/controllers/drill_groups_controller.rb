class DrillGroupsController < ApplicationController

  before_action :find_drill_group, only: [:show, :edit, :update, :destroy]

  def new
    @drill_group = DrillGroup.new
  end

  def create
    # drill_group_params method defined below
    # category = params[:category_id]

    drill_group_params
    @drill_group = DrillGroup.new(drill_group_params)
    # @drill_group.category = category

    if @drill_group.save
      # need to test once category CRUD implemented
      redirect_to(category_drill_group_path(@drill_group), notice: "Drill Group Created!")
    else
      render :new
    end
  end


  def show
    # note before_action has find_drill_group
    # need to also find category
  end


  def edit
    # note before_action has find_drill_group

  end

  def update
    # note before_action has find_drill_group
    drill_group_params

    if @drill_group.update(drill_group_params)
      redirect_to category_snippet_path(@category, @snippet), notice: "Drill Group updated!"
    else
      render :edit
    end
  end

  def destroy
    # note before_action has find_drill_group
    @drill_group.destroy

    redirect_to root_path, alert: "Drill Group deleted!"
  end


  def drill_group_params
    params.require(:drill_group).permit([:name, :description])
  end

  def find_drill_group
    @drill_group = DrillGroup.find(params[:id])
  end

end
