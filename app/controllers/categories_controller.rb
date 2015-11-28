class CategoriesController < ApplicationController

  before_action :find_category, only: [:edit, :update, :show, :destroy]

  def new
    @category = Category.new
  end

  def create
    category_params
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
    category_params
    if @category.update(category_params)
      redirect_to categories_path, notice: "Category name successfully updated."
    else
      redirect_to category_path(@category)
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
    category_params = params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find params[:id]
  end

end
