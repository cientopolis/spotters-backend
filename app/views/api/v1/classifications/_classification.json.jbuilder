json.extract! classification, :id, :candidate_id, :data, :created_at, :updated_at
json.url api_v1_candidate_classification_url(@candidate, classification, format: :json)
