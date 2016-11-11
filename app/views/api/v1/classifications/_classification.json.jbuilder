json.extract! classification, :id, :status, :data, :created_at, :updated_at
json.user do
  json.sub classification.user.sub
  json.name classification.user.name
end
json.classification_votes do
  json.array! classification.classification_votes do |classification_vote|
    json.id classification_vote.id
    json.positive classification_vote.positive
    json.user do
      json.sub classification_vote.user.sub
      json.name classification_vote.user.name
    end
  end
end
