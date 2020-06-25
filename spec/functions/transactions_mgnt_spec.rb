require 'rails_helper'

RSpec.describe 'Transactions cycle:' do
  before :each do
    @user = User.create!(name: 'username', email: 'username@gmail.com', \
                         password: 'secret', password_confirmation: 'secret')
    @group = @user.groups.create!(name: 'prueba', icon: 'icons/car.png')
    @trans = @user.transactions.create!(name: 'transaction_tst', amount: 5, user_id: @user.id, group_id: @group.id)
  end

  it 'creates a grouped transaction' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'username@gmail.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'
    visit '/transactions/new'
    fill_in 'Name', with: 'a new transsaction'
    fill_in 'Amount', with: 15
    groupid = "transaction_group_id_#{@group.id}"
    page.choose groupid
    click_on 'Create Transaction'
    visit '/transaction/user'
    expect(page).to have_content('a new transsaction')
  end

  it 'can not create non numeric transactions' do
    visit '/users/sign_in'
    fill_in 'Email', with: 'username@gmail.com'
    fill_in 'Password', with: 'secret'
    click_on 'Log in'
    visit '/transactions/new'
    fill_in 'Name', with: 'a new transsaction'
    fill_in 'Amount', with: 'non numeric'
    groupid = "transaction_group_id_#{@group.id}"
    page.choose groupid
    click_on 'Create Transaction'
    expect(page).to have_content('New Transaction')
  end
end
