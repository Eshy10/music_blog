require 'rails_helper'

RSpec.describe Article, type: :model do

  subject(:user) { User.new(name: 'Shola') }

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:image) }
    it { should validate_presence_of(:categories) }
    end
  
    describe 'associations' do
      it { should have_many(:article_categories)}
      it { should have_many(:votes)}
      it { should belongs_to(:author).through(:user)}
    end
  
    it 'fails validation with no name expecting a specific message' do
      no_article_title = Article.new(title: '')
      no_article_title.valid?
      expect(no_article_title.errors[:title]).to include('can\'t be blank')
    end

    describe 'users vote' do
      expect()
    end
end
