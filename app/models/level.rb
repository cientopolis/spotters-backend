class Level < ApplicationRecord
  has_attached_file :icon

  validates_attachment_content_type :icon, content_type: /\Aimage\/.*\z/
end
