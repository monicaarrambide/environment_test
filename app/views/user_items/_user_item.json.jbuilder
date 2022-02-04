json.extract! user_item, :id, :user_id, :item_id, :created_at, :updated_at
json.url user_item_url(user_item, format: :json)
