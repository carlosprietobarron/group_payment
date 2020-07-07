class CreateBudgetTable < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.decimal :budget
      t.decimal :spent
      t.references :user
      t.references :group
    end
    
  end
end
