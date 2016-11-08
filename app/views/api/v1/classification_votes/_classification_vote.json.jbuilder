json.extract! classification_vote, :id, :positive, :created_at, :updated_at
json.user do
  json.sub classification_vote.user.sub
  json.name classification_vote.user.name
end
