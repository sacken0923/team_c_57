10.times do|i|
  Item.create(name: "人造人間#{i+1}号", price: i*100, description: "人造人間#{i}号です", state: 1, delivery: 1, shipping_method: 1,shipping_time: 1,like: 1, seller_id: 1, buyer_id: 1)
end


12.times do |i|
  Photo.create(image: "kakarotto.jpg", item_id: i+1 )
end