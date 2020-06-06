class ArticlesController < ApplicationController
  def index
  end

  def new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash.notice = 'Event created'
      redirect_to @article
    else
      render :new
    end
  end

  private

  def article_params
    params.require(:articles).permit(:title, :text, :image, category_ids: [])
  end

end
