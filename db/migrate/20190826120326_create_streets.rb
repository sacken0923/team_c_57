class CreateStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :streets do |t|
      t.string  :city,  null: false
      t.string  :adress,  null: false
      t.string  :building
      t.timestamps
    end
  end
end
