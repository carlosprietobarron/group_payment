module TransactionsHelper
  def edit_btn(author, trans_id)
    link_to 'Edit', edit_transaction_path(Transaction.find(trans_id)) if current_user.id == author
  end

  # rubocop:disable Layout/LineLength
  def delete_btn(author, trans_id)
    link_to 'Destroy', Transaction.find(trans_id), method: :delete, data: { confirm: 'Are you sure?' } if current_user.id == author
  end
  # rubocop:enable Layout/LineLength
  
end
