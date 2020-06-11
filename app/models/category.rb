class Category < ApplicationRecord
  has_many :article_categories
  has_many :articles, through: :article_categories
  has_many :ordered_by_most_recent, -> { order(created_at: :desc) }, through: :article_categories, source: :article
  validates :name, presence: true, length: { minimum: 3 }
end
