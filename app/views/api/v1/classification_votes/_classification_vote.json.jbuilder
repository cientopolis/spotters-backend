json.extract! classification_vote, :id, :positive, :created_at, :updated_at
json.user do
  json.id classification_vote.user_id
  json.name classification_vote.user.name
end
