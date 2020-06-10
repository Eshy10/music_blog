class Article < ApplicationRecord
  has_many :article_categories
  has_many :categories, through: :article_categories
  has_many :votes
  has_many :voters, through: :votes
  belongs_to :author, class_name: 'User'
  validates :image, :categories, presence: true
  validates :text, presence: true, length: { in: 10..200 }
  validates :title, presence: true, length: { in: 6..10 }
  mount_uploader :image, PictureUploader
  scope :ordered_by_most_recent, -> { order(created_at: :desc) }
  has_many :users_vote, through: :votes, source: :user
  scope :highest_vote, -> { order(votes_count: :desc) }

  def voted?(userid)
    true if users_vote.where(id: userid).first
  end

  def upvote(userid)
    vote = votes.build
    vote.user_id = userid
    update votes_count: votes_count + 1
    vote.save
  end

  def downvote(userid)
    votes.where(user_id: userid).first.destroy
    update votes_count: votes_count - 1
  end
end
