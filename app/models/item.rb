class Item < ApplicationRecord
  
  has_many :photos , dependent: :destroy

  belongs_to :category

  accepts_nested_attributes_for :photos


  enum state: {"---": 0,"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "傷や汚れあり": 4, "全体的に状態が悪い": 5}, _suffix: true
  enum delivery: {"---": 0,"送料込み（出品者負担）": 1,"着払い(購入者負担)": 2}, _suffix: true
  enum shipping_time: {"---": 0,"1〜2日で発送": 1, "2〜3日で発送": 2, "4~7日で発送": 3}, _suffix: true
end
