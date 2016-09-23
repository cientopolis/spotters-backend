json.extract! message_vote, :id, :positive, :user_id, :message_id, :created_at, :updated_at
json.url message_vote_url(message_vote, format: :json)