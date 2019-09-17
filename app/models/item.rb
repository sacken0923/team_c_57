class Item < ApplicationRecord
  
  has_many :photos , dependent: :destroy

  belongs_to :category

  accepts_nested_attributes_for :photos

  validates :name,                           presence: true
  validates :price,                          presence: true
  validates :description,                    presence: true
  validates :state,                          presence: true
  validates :delivery,                       presence: true
  validates :shipping_method,                presence: true
  validates :shipping_time,                  presence: true
  validates :region,                         presence: true
  

end
