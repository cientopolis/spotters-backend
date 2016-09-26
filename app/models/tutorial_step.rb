class TutorialStep < ApplicationRecord
  validates :title, presence: true
  validates :text, presence: true
  validates :position, presence: true
end
