class UserNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_index :users, :name, unique: true
  end
end
