json.extract! item, :id, :name, :description, :stock, :price, :images, :created_at, :updated_at
json.url item_url(item, format: :json)
