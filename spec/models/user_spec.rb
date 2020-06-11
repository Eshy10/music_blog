require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { User.new(name: 'Shola') }

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  context 'name should be valid' do
    it 'should require a name' do
      expect(FactoryBot.build(:user, name: '')).not_to be_valid
    end

    it 'should only accept letters and spaces in name' do
      expect(FactoryBot.build(:user, name: 'Shola')).to be_valid
    end
  end

  describe 'associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end

  it 'fails validation with no name expecting a specific message' do
    no_name_user = User.new(name: '')
    no_name_user.valid?
    expect(no_name_user.errors[:name]).to include('can\'t be blank')
  end
end
