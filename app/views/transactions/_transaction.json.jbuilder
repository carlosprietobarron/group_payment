json.extract! transaction, :id, :name, :description, :price, :price, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
