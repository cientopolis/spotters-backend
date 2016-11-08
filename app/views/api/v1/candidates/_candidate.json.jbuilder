json.extract! candidate, :id, :status, :heading, :pitch, :created_at, :updated_at

json.lat candidate.location.y
json.lng candidate.location.x

json.owner do
  if !candidate.owner.nil?
    json.sub candidate.owner.sub
    json.name candidate.owner.name
  end
end

json.expert do
  if !candidate.expert.nil?
    json.sub candidate.expert.sub
    json.name candidate.expert.name
  end
end

json.classifications do
  json.array! candidate.classifications do |classification|
    json.id classification.id
    json.data classification.data
    json.created_at classification.created_at
    json.updated_at classification.updated_at
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
        json.created_at classification_vote.created_at
        json.updated_at classification_vote.updated_at
      end
    end
  end
end

json.messages do
  json.array! candidate.messages do |message|
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
  end
end
