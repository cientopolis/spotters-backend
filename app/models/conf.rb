class Conf < ApplicationRecord
  validates :title, presence: true
  validates :zoom, presence: true
  validates :center, presence: true
  validates :heading_center, presence: true
  validates :pitch_center, presence: true
  validates :proximity_distance, presence: true
end
