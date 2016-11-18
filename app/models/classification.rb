class Classification < ApplicationRecord
  enum status: [:created, :confirmed, :rejected]

  belongs_to :candidate
  belongs_to :user
  belongs_to :expert, class_name: 'User'
  has_many :classification_votes

  validates :status, presence: true
  validates :candidate, presence: true
  validates :user, presence: true
  validates :data, presence: true

  rails_admin do
    field :data, :text
    include_all_fields
  end
end
