class Task < ApplicationRecord
  belongs_to :workflow
  belongs_to :next, class_name: 'Task', foreign_key: 'next_id'

  rails_admin do
    field :content, :text
    include_all_fields
  end
end
