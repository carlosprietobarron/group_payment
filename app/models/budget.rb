class Budget
    validate :budget, presence: true
    validate :user_id uniqueness: { scope: :group_id,
            message: "should happen once per year" }
    belongs_to :user, :foreign_key => 'user_id'
    belongs_to :group, :foreign_key => 'group_id'
end