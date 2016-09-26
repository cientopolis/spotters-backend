json.extract! message_vote, :id, :positive, :user_id, :message_id, :created_at, :updated_at
json.user do
  json.id message_vote.user_id
  json.name message_vote.user.name
end
