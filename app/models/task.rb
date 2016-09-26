class Task < ApplicationRecord
  belongs_to :workflow

  validates :workflow, presence: true
  validates :widget_type, presence: true
  validates :content, presence: true

  rails_admin do
    field :content, :text
    include_all_fields
  end
end
