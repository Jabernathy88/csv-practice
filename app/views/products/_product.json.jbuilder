json.extract! product, :id, :name, :release_date, :price, :created_at, :updated_at
json.url product_url(product, format: :json)
