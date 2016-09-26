json.extract! classification_vote, :id, :positive, :classification_id, :created_at, :updated_at
json.user do
  json.id classification_vote.user_id
  json.name classification_vote.user.name
end
json.url api_v1_candidate_classification_classification_vote_url(@candidate, @classification, classification_vote, format: :json)
