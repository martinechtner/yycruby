json.extract! news, :id, :content, :created_at, :updated_at
json.url news_url(news, format: :json)