class MessageVote < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :positive, presence: true
  validates :message, presence: true
  validates :user, presence: true
end
