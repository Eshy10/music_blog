class User < ApplicationRecord
validates :name, presence: true
has_many :articles, class_name: 'Article', foreign_key: :author_id
 
end
