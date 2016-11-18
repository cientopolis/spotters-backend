json.extract! classification_vote, :id, :positive, :created_at, :updated_at
json.user do
  json.sub classification_vote.user.sub
  json.name classification_vote.user.name
  json.role classification_vote.user.role
end
