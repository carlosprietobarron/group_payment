class Transaction < ApplicationRecord
  validates :name, :amount, presence: true
  belongs_to :user
  belongs_to :group, optional: true
  
  scope :grouped, -> { where.not(group_id: nil) }
  scope :ungrouped, -> { where(group_id: nil) }
end
