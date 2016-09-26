class Message < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
  has_many :message_votes

  validates :text, presence: true
  validates :candidate, presence: true
  validates :user, presence: true
end
