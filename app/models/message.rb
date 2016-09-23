class Message < ApplicationRecord
  belongs_to :user
  belongs_to :candidate
end
