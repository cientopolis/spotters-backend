json.extract! classification, :id, :candidate_id, :data, :created_at, :updated_at
json.user do
  json.id classification.user_id
  json.name classification.user.name
end
json.classification_votes do
  json.array! classification.classification_votes do |classification_vote|
    json.id classification_vote.id
    json.positive classification_vote.positive
    json.user do
      json.id classification_vote.user_id
      json.name classification_vote.user.name
    end
  end
end
json.url api_v1_candidate_classification_url(@candidate, classification, format: :json)
