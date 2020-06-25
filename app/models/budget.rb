class Budget
    validate :budget, presence: true
    belongs_to :user, :foreign_key => 'user_id'
    belongs_to :group, :foreign_key => 'group_id'
end