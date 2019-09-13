class Item < ApplicationRecord
  
  has_many :photos , dependent: :destroy

  # belongs_to :category

  accepts_nested_attributes_for :photos



  

  # enum shipping_method: {"---": 0,"未定": 1,"らくらくメルカリ便": 2, "ゆうメール": 3, "レターパック": 4, "普通郵便（定型、定型外": 5,"クロネコヤマト": 6,"ゆうパック": 7, "クリックポスト": 8,"ゆうパケット": 9 }, _suffix: true

end
