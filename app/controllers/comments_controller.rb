class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.article_id = params[:article_id]
    @comment.user = current_user

    if @comment.save
      redirect_to root_path, notice: 'Comment added to this post.'
    else
      redirect_to root_path, alert: 'an error occured'
    end
  end


  private 

  def comment_params
    params.require(:comment).permit(:content)
  end

end
