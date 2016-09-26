json.extract! news, :id, :title, :text, :created_at, :updated_at
json.url api_v1_news_url(news, format: :json)
