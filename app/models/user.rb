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

  def total_transaction(user_id)
    Transaction.where(user_id: user_id).sum(:amount)
    # @total =  user.transactions.inject(0) { |sum, t| sum + t.amount }
    # return @total
  end

  has_many :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :friends, through: :friendships, class_name: 'User', foreign_key: 'user_id'

  def friends
    # rubocop:disable Lint/Void
    friends_array = friendships.map { |friendship| friendship.friend if friendship.confirmed }
    friends_array + inverse_friendships.map { |friendship| friendship.user if friendship.confirmed }
    friends_array.compact
    # rubocop:enable Lint/Void
  end

  def pending_friends
    friendships.map { |friendship| friendship.friend unless friendship.confirmed }.compact
  end

  def friend_request
    inverse_friendships.map { |friendship| friendship.user unless friendship.confirmed }.compact
  end

  def confirm_friend(user)
    ActiveRecord::Base.transaction do
      friendship = inverse_friendships.find_by user_id: user.id
      friendship.update!(confirmed: true)
      friendship.save
      inverse_rel = friendships.new(friend_id: user.id, confirmed: true)
      inverse_rel.save!
    end
  end

  def friend?(user)
    friends.include?(user)
  end
end
