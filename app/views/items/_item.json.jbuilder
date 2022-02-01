json.extract! item, :id, :title, :author, :price, :date, :created_at, :updated_at
json.url item_url(item, format: :json)
