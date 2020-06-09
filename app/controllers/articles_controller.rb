class ArticlesController < ApplicationController
  def index
  end

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

  def upvote
    @article = Article.find(params[:id])
    if @article.present?
     @article.upvote(current_user.id)
    if @article.save
      flash[:notice] = 'You voted for this article'
      redirect_to request.referer
    else
      flash[:alert] = 'An error occured'
    end
   end
    
  end

  def downvote
    @article = Article.find(params[:id])
    if @article
      @article.downvote(current_user.id)
      flash[:alert] =  "vote deleted!"
      redirect_to request.referer
    else 
      flash[:alert] =  "You can't delete a vote that you didnt vote for"
      redirect_to root_path
    end
  end


  private

  def article_params
    params.require(:article).permit(:title, :text, :image, category_ids: [])
  end

end
