module TransactionsHelper
  def edit_btn(author,trans_id)
    if current_user.id == author
      link_to 'Edit', edit_transaction_path(Transaction.find(trans_id))
    end
    end
    def delete_btn(author,trans_id)
      if current_user.id == author
        link_to 'Destroy', Transaction.find(trans_id), method: :delete, data: { confirm: 'Are you sure?' } 
      end
    end
end
