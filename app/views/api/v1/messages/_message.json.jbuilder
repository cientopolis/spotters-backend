json.extract! message, :id, :text, :candidate_id, :created_at, :updated_at
json.user do
  json.id message.user_id
  json.name message.user.name
end
json.message_votes do
  json.array! message.message_votes do |message_vote|
    json.id message_vote.id
    json.positive message_vote.positive
    json.user do
      json.id message_vote.user_id
      json.name message_vote.user.name
    end
  end
end
json.url api_v1_candidate_message_url(@candidate, message, format: :json)
