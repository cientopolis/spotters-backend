json.extract! candidate_type, :id, :name, :points_confirmed, :points_rejected, :points_success, :points_failure, :created_at, :updated_at
json.url candidate_type_url(candidate_type, format: :json)