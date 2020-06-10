module ApplicationHelper
  def admin(user)
    link_to 'Create category', new_category_path, class: 'nav-link font-weight-bold' if !user.nil? && user.admin
  end

  def upvote_or_downvote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)
    if vote
      link_to('<i class="fa fa-thumbs-down"></i>'.html_safe,
              article_vote_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('<i class="fa fa-thumbs-up"></i>'.html_safe, article_votes_path(article_id: article.id), method: :post)
    end
  end
end
