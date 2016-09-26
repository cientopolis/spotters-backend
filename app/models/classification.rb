class Classification < ApplicationRecord
  belongs_to :candidate
  belongs_to :user
  has_many :classification_votes

  rails_admin do
    field :data, :text
    include_all_fields
  end
end
