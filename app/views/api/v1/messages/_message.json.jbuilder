json.id message.id
json.text message.text
json.user do
  json.sub message.user.sub
  json.name message.user.name
end
json.created_at message.created_at
json.updated_at message.updated_at
json.message_votes do
  json.array! message.message_votes do |message_vote|
    json.id message_vote.id
    json.positive message_vote.positive
    json.user do
      json.sub message_vote.user.sub
      json.name message_vote.user.name
    end
    json.created_at message_vote.created_at
    json.updated_at message_vote.updated_at
  end
end
