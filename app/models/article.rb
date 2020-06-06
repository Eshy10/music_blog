class Article < ApplicationRecord
    has_many :article_categories
    has_many :categories, through: :article_categories
    has_many :votes
    has_many :voters, through: :votes
    belongs_to :author, class_name: 'User'
    validates :title, :text, :image, presence: true
    validates_presence_of :image, message: 'is not uploaded'
    validates_presence_of :categories, message: 'not selected.'
    mount_uploader :image, PictureUploader
    scope :ordered_by_most_recent, -> { order(created_at: :desc) }

    def highest_vote

    end
end
