class Article < ApplicationRecord
    has_many :article_categories
    has_many :categories, through: :article_categories
    has_many :votes, :counter_cache => true
    has_many :voters, through: :votes
    has_many :comments
    belongs_to :author, class_name: 'User'
    validates :title, :text, :image, presence: true
    validates_presence_of :image, message: 'is not uploaded'
    validates_presence_of :categories, message: 'not selected.'
    mount_uploader :image, PictureUploader
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }
    scope :highest_vote, -> { order(votes_count: :desc) }


  def upvote(user)
    vote = votes.build
    vote.user_id = user
    vote.save
  end

  def downvote(user)
    votes.where(user_id: user).first.destroy
    end
  end

