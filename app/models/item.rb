class Item < ApplicationRecord
  has_many :photos
  belongs_to :user
end
