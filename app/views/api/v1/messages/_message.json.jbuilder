json.extract! message, :id, :text, :user_id, :candidate_id, :created_at, :updated_at
json.url api_v1_candidate_message_url(@candidate, message, format: :json)
