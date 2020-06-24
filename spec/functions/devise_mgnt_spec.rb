require 'rails_helper'

RSpec.describe 'User sessions Management', type: :feature do
  context 'Sign_up user' do
    it 'sign up a new user with name, email and pwrd' do
      visit '/users/sign_up'
      fill_in 'Name', with: 'testing'
      fill_in 'Email', with: 'testing@gmail.com'
      fill_in 'Password', with: 'secret'
      fill_in 'Password confirmation', with: 'secret'
      click_button 'commit'
      visit '/user/show'
      expect(page).to have_content('testing')
    end
  end
end
