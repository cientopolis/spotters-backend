class Candidate < ApplicationRecord
  enum status: [:active, :locked, :discarded]

  belongs_to :owner, class_name: 'User'
  belongs_to :expert, class_name: 'User'
  has_many :classifications
  has_many :messages

  validates :status, presence: true
  validates :location, presence: true
  validates :heading, presence: true
  validates :pitch, presence: true
  validates :owner, presence: true

  rails_admin do
    include_all_fields
  end
end
