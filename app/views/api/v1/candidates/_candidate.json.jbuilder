json.extract! candidate, :id, :status, :location, :heading, :pitch, :owner_id, :expert_id, :created_at, :updated_at
json.url api_v1_candidate_url(candidate, format: :json)
