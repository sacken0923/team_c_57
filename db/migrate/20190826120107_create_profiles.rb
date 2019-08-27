class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string  :image
      t.text  :text
      t.references :user,  null:false
      t.timestamps
    end
  end
end
