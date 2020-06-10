class ArticlesController < ApplicationController
  skip_before_action :require_user, only: [:index]

  def index; end

  def new
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.new(article_params)
    @article.author_id = current_user.id
    if @article.save
      flash[:notice] = 'Article created'
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end
end
