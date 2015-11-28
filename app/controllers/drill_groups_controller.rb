class DrillGroupsController < ApplicationController

  before_action :find_drill_group, only: [:show, :edit, :update, :destroy]

  def new
    @drill_group = DrillGroup.new
  end

  def create
    # drill_group_params method defined below
    drill_group_params
    @drill_group = DrillGroup.new(drill_group_params)


    if @drill_group.save
      # need to test once category CRUD implemented
      redirect_to(category_drill_group_path(@drill_group), notice: "Drill Group Created!")
    else
      render :new
    end
  end


  def show
    # note before_action has find_drill_group

    respond_to do |format|
    format.html {render}
    # if we end up using AJAX
    format.json {render json: @q.to_json}
end

  end

  def edit
    # note before_action has find_drill_group
  end

  def update
    # note before_action has find_drill_group
  end

  def destroy
    # note before_action has find_drill_group
  end


  def drill_group_params
        params.require(:drill_group).permit([:name, :description])
  end

  def find_drill_group
      @drill_group = DrillGroup.find(params[:id])
  end

end
