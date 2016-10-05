json.extract! sponsor, :id, :company, :description, :url, :sponsoring, :created_at, :updated_at, :logo
json.url sponsor_url(sponsor, format: :json)
