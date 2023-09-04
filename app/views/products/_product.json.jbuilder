json.extract! product, :id, :name, :image, :image_url, :created_at, :updated_at
json.url product_url(product, format: :json)
