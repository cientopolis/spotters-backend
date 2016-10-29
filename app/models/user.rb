class User < ActiveRecord::Base
  has_many :classifications
  has_many :classification_votes
  has_many :messages
  has_many :message_votes
  has_many :created_candidates, foreign_key: "owner_id", class_name: "Candidate"
  has_many :evaluated_candidates, foreign_key: "expert_id", class_name: "Candidate"
end
