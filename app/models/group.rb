class Group < ApplicationRecord
  validates :name, :icon, presence: true
  belongs_to :user, :foreign_key => 'user_id'
  has_many :transactions
end
