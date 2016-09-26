class Message < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  has_many :message_votes
end
