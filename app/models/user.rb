class User < ApplicationRecord
  validates :name, :email, presence: true
  validates_length_of :name, minimum: 5, maximum: 30
  validates_uniqueness_of :name, :email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions
  has_many :groups

  def grouped_trans
    transactions.map { |transaction| transaction unless transaction.group.nil? }.compact
  end

  def ungrouped_trans
    transactions.map { |transaction| transaction if transaction.group.nil? }.compact
  end
end
