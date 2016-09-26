class Task < ApplicationRecord
  belongs_to :workflow

  rails_admin do
    field :content, :text
    include_all_fields
  end
end
