json.extract! news, :id, :title, :text, :author_id, :created_at, :updated_at
json.url api_v1_news_url(news, format: :json)
