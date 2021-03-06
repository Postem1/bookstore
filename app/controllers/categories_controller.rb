class CategoriesController < ApplicationController

  def new
    @page_title = "Add New Category"
    @category = Category.new
  end

  def create
    @category  = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category created succesffully"
    redirect_to categories_path
    else
    render 'new'
    end
  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)
    if @category.save
      flash[:notice] = "Category updated succesffully"
    redirect_to categories_path
    else
    render 'edit'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def destroy
    @category = Category.find(params[:id])
    if @category.destroy
      flash[:notice] = "Category deleted succesffully"
    redirect_to categories_path
    else
      flash.now[:alert] = "Category was NOT succesffully deleted"
    render 'edit'
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @books = @category.books
    @categories = Category.all
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end
end
