class CategoriesController < ApplicationController
  before_action :find_category, only: [:edit, :update, :show, :destroy]

  # adds CanCanCan authorization for all controller actions
  load_and_authorize_resource

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "You have successfully created a new category."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category name successfully updated."
    else
      render :edit
    end
  end

  def show

  end

  def index
    @categories = Category.order(:name)
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "The selected category was successfully deleted."
  end



  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find params[:id]
  end

end
