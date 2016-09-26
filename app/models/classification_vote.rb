class ClassificationVote < ApplicationRecord
  belongs_to :classification
  belongs_to :user

  validates :positive, presence: true
  validates :classification, presence: true
  validates :user, presence: true
end
