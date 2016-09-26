class Candidate < ApplicationRecord
  enum status: [:active, :locked, :discarded]

  belongs_to :owner, class_name: 'User'
  belongs_to :expert, class_name: 'User'
  has_many :classifications
  has_many :messages

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
