require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:user) { User.create!(name: 'user some', email: 'usome@gmail.com', password: 'secret') }
  let(:transaction) { Transaction.create!(name: 'test_expense', amount: 20, user_id: user.id) }

  it 'is valid with all the fields' do
    trans = Transaction.new(name: 'sometran', amount: 5, user_id: user.id)
    expect(trans.valid?).to be(true)
  end

  it 'is not valid with no name' do
    trans = Transaction.new(amount: 5, user_id: user.id)
    expect(trans.valid?).to be(false)
  end

  it 'is not valid with no amount' do
    trans = Transaction.new(name: 'sometran', user_id: user.id)
    expect(trans.valid?).to be(false)
  end

  it 'is not valid with negative amount' do
    trans = Transaction.new(name: 'sometran', amount: -1, user_id: user.id)
    expect(trans.valid?).to be(false)
  end

  it 'is not valid with non numeric amount' do
    trans = Transaction.new(name: 'sometran', amount: 'no numeric', user_id: user.id)
    expect(trans.valid?).to be(false)
  end

    describe "Associations" do
      it { should belong_to(:user) }
      it { is_expected.to belong_to(:group).optional(true) }
    end
end
