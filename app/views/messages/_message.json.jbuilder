json.extract! message, :id, :text, :user_id, :candidate_id, :created_at, :updated_at
json.url message_url(message, format: :json)