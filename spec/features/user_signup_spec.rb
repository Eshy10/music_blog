require 'rails_helper'

RSpec.describe 'signup page', type: :feature do
    scenario 'signup page' do
      visit signup_path
      fill_in 'user_name', with: 'maggie'
      click_button 'Submit'
      expect(page).to have_content('maggie')
    end
end