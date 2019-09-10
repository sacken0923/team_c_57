class Item < ApplicationRecord
  
  has_many :photos , dependent: :destroy

  belongs_to :category

  accepts_nested_attributes_for :photos

end
