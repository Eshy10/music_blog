class ArticlesController < ApplicationController
  def index
    
  end

  def new
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      flash[:notice] = 'Article created'
      redirect_to @article
    else
      render :new
    end
  end

  def upvote
    @article = Article.find(params[:id])
  
    if @article.votes.create(user_id: current_user.id)
      flash[:notice] =  "Thank you for upvoting!"
      redirect_to(articles_path)
    else 
      flash[:notice] =  "You have already upvoted this!"
      redirect_to(articles_path)
    end
  end

  def downvote
    @article = Article.find(params[:id])
  
    if @article.votes.destroy(user_id: current_user.id)
      flash[:notice] =  "vote deleted!"
      redirect_to(articles_path)
    else 
      flash[:alert] =  "You can't delete a vote that you didnt vote for"
      redirect_to(articles_path)
    end
  end

  private

  def article_params
    params.require(:articles).permit(:title, :text, :image, category_ids: [])
  end

end
