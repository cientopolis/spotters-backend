json.extract! candidate, :id, :status, :location, :heading, :pitch, :candidate_type_id, :owner_id, :expert_id, :created_at, :updated_at
json.url candidate_url(candidate, format: :json)