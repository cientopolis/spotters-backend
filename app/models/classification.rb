class Classification < ApplicationRecord
  belongs_to :candidate

  rails_admin do
    field :data, :text
    include_all_fields
  end
end
