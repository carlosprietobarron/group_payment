class Transaction < ApplicationRecord
  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :group, optional: true, foreign_key: 'group_id'

  scope :grouped, -> { where.not(group_id: nil) }
  scope :ungrouped, -> { where(group_id: nil) }
end
