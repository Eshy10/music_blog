require 'rails_helper'

RSpec.describe 'login page', type: :feature do
    let(:user) { User.create(name: 'Gaby') }
  
    scenario 'login page' do
      visit login_path
      fill_in 'session_name', with: user.name
      click_button 'Log in'
      expect(page).to have_content('Logged in!')
    end
  end