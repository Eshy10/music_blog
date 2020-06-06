class Article < ApplicationRecord
    has_many :article_categories
    has_many :categories, through: :article_categories
    belongs_to :author, class_name: 'User'
    validates :title, :text, :image, presence: true
    validates_presence_of :image, message: 'is not uploaded'
    validates_presence_of :categories, message: 'not selected.'
    mount_uploader :image, PictureUploader
end
