RSpec.describe Transaction, type: :model do
    let(:user) { User.create!(name: 'user some', email: 'usome@gmail.com', password: 'secret') }
    let(:group) { Group.create!(name: 'testinggrp', icon: 'icons/car.png') }

  it 'is valid with all the fields' do 
    group = Group.new(name: 'test_group', icon: 'icons/case.png')
    expect(group.valid?).to be(true)
  end

  it 'is not valid with no name' do 
    group = Group.new( icon: 'icons/case.png' )
    expect(group.valid?).to be(false)
  end
  
  it 'is not valid with no icon' do 
    group = Group.new(name: 'test_group' )
    expect(group.valid?).to be(false)
  end
end