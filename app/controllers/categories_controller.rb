class CategoriesController < ApplicationController
  before_action :require_user, only: [:show]
  def index
    @liked_article = Article.highest_vote.first
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:notice] = "Category was created successfully"
      redirect_to root_path
    else
      flash[:alert] = "An error occurred"
      render 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    if @category.update(category_params)
      flash[:success] = "Category name was updated successfully"
      redirect_to category_path(@category)
    else
      render 'edit'
    end
  end
  
  def show
    @category = Category.find(params[:id])
    @category_articles = @category.articles.ordered_by_most_recent
  end

  private
  
  def category_params
    params.require(:category).permit(:name)
  end

  def require_user
    if !logged_in?
     flash[:notice] = 'You are required to log in before you perform this action'
     redirect_to root_path
    end
end
end
