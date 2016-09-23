class CandidateType < ApplicationRecord
  has_attached_file :icon_unknown
  has_attached_file :icon_negative_confirmed
  has_attached_file :icon_negative_rejected
  has_attached_file :icon_negative_unknown
  has_attached_file :icon_positive_confirmed
  has_attached_file :icon_positive_rejected
  has_attached_file :icon_positive_unknown

  validates_attachment_content_type :icon_unknown, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_negative_confirmed, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_negative_rejected, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_negative_unknown, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_positive_confirmed, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_positive_rejected, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :icon_positive_unknown, content_type: /\Aimage\/.*\z/
end
