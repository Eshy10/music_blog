class User < ApplicationRecord
validates :name, presence: true
has_many :articles, class_name: 'Article', foreign_key: :author_id
has_many :votes
has_many :liked_posts, through: :votes
has_many :comments, dependent: :destroy
end
