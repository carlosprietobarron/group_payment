class Group < ApplicationRecord
  validates :name, :icon, presence: true
  has_many :transactions
end
