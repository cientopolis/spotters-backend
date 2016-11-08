json.extract! message_vote, :id, :positive, :user_id, :message_id, :created_at, :updated_at
json.user do
  json.sub message_vote.user.sub
  json.name message_vote.user.name
end
