class CategoriesController < ApplicationController

  before_action :require_admin, except: [:index, :show]

  def index
    @categories = Category.paginate per_page: 5, page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = "Category was created successfully"
      redirect_to categories_path
    else
      # flash[:danger] =
      render 'new'
    end
  end

  def show
    @category = Category.find params[:id]
    @category_articles = @category.articles.paginate per_page: 5, page: params[:page]
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update category_params
      flash[:success] = "Category name was successfully updated"
      redirect_to categories_path
    else
      flash[:danger] = "Your update is unsuccessful"
      render 'edit'
    end
  end

  private
  def category_params
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || (logged_in? && !current_user.admin?)
      # byebug
      flash[:danger] = "You are not authorized to perform operation"
      redirect_to categories_path
    end
  end

end