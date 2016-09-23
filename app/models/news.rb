class News < ApplicationRecord
  belongs_to :author, class_name: 'Admin'
end
