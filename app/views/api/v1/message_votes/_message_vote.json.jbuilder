json.extract! message_vote, :id, :positive, :user_id, :message_id, :created_at, :updated_at
json.url api_v1_candidate_message_message_vote_url(@candidate, @message, message_vote, format: :json)
