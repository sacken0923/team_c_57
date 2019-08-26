class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string  :name,  null: false
      t.integer  :price,  null:false
      t.text  :description,  null:false
      t.integer  :state,  null:false
      t.integer  :delivery,  null:false
      t.integer  :shipping_method,  null:false
      t.integer  :shipping_time,  null:false
      t.integer  :like
      t.integer  :seller_id,  null:false
      t.integer  :buyer_id
      t.references :brand,  foreign_key: true
      t.timestamps
    end
  end
end
