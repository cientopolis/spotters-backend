json.extract! classification_vote, :id, :positive, :classification_id, :user_id, :created_at, :updated_at
json.url api_v1_candidate_classification_classification_vote_url(@candidate, @classification, classification_vote, format: :json)
