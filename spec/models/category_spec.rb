require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:article_categories) }
    it { should have_many(:articles).through(:article_categories) }
  end
end
