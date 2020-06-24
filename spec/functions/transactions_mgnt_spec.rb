require 'rails_helper'


RSpec.describe 'Transactions cycle:' do
  before :each do
    user = User.create!(name: 'username', email: 'username@gmail.com', password: 'secret', password_confirmation: 'secret')
    group = user.groups.create!(name: 'test group', icon: 'icons/car.png')
    trans = user.transactions.create!(name: 'transaction_tst', amount:5, user_id: user.id, group_id: group.id)
  end

  it 'creates a grouped transaction' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'user@gmail.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'
    visit new_transaction_path
    fill_in 'Name', with: 'a new transsaction'
    fill_in 'Amount', with: 15
    page.select 'business_travel', from: 'transaction[group_id]'
    click_on 'Save'
    visit index_by_user_path
    expect(page).to have_content('a new transsaction', 'business_travel')
  end
end