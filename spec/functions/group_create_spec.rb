require 'rails_helper'

RSpec.describe 'group cycle:' do
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
    visit '/groups/new'
    fill_in 'Name', with: 'Novogroup'
    page.choose 'group_icon_iconscarpng'
    click_on 'Create Group'
    visit '/groups'
    expect(page).to have_content('Novogroup')
  end
end
