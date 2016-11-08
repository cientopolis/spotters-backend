class MessageVote < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :message, presence: true
  validates :user, presence: true
end
