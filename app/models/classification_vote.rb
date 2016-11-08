class ClassificationVote < ApplicationRecord
  belongs_to :classification
  belongs_to :user

  validates :classification, presence: true
  validates :user, presence: true
end
