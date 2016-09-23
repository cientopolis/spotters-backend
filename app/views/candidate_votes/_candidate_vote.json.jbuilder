json.extract! candidate_vote, :id, :positive, :user_id, :candidate_id, :created_at, :updated_at
json.url candidate_vote_url(candidate_vote, format: :json)