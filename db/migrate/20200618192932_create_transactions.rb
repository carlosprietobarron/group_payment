class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.string :name
      t.text :description
      t.decimal :amount 
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end
  end
end
