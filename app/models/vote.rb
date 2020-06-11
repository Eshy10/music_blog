class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article, counter_cache: true
  validates :user_id, uniqueness: { scope: :article_id }
end
