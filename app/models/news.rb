class News < ApplicationRecord
  belongs_to :author, class_name: 'Admin'

  validates :title, presence: true
  validates :text, presence: true
  validates :author, presence: true
end
