class AddAddressLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_last_name, :string
  end
end
