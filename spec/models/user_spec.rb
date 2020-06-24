require 'rails_helper.rb'
describe User, type: :model do
  before :each do
    User.create(name: 'name', email: 'some@someserver.com')
  end

  describe 'New User' do
    subject(:user) { User.new }

    it 'returns an user class object' do
      expect(user).to be_a_new(User)
    end

    it 'fails to create a user without name' do
      u = User.new(email: 'any@gamil.com')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user without email' do
      u = User.new(name: 'any name')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user with not unique email' do
      u = User.new(name: 'any', email: 'some@someserver.com')
      expect(u.persisted?).to eql(false)
    end

    it 'fails to create a user with not unique email' do
      u = User.new(name: 'name', email: 'another@someserver.com')
      expect(u.persisted?).to eql(false)
    end
  end

  describe 'A user can create many groups and transactions' do
    subject(:user) { User.new }
    it 'expect to return a new group with groups.new' do
      group = user.groups.new
      expect(group).to be_a_new(Group)
    end

    it 'expect to return a new transaction with transactions.new' do
        trans = user.transactions.new
        expect(trans).to be_a_new(Transaction)
    end
  end
end
