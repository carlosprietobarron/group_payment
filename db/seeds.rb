# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
include Faker

10.times do
  user  = User.new
  user.email = Faker::Internet.email
  user.name =  Faker::Name.first_name
  user.password =  'secret'
  user.password_confirmation =  'secret'
  user.save

  5.times do 
      group = user.groups.new
      group.name = Faker::String.random(length: 5..10)
      group.icon = "icons/car.png"
      group.save
    3.times do 
      t=group.transactions.new
      t.name = Faker::String.random(length: 5..10)
      t.description = "Alguna descripcion de transaccion"
      t.amount = Faker::Number.number.to_f
      t.user_id = user.id
      t.save
    end
  end
end
