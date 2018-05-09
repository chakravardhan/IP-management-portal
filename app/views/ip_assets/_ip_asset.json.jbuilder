json.extract! ip_asset, :id, :title, :description, :filename, :created_at, :updated_at
json.url ip_asset_url(ip_asset, format: :json)