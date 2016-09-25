class ClassificationVote < ApplicationRecord
  belongs_to :classification
  belongs_to :user
end
