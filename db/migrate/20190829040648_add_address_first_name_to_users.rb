class AddAddressFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :address_first_name, :string
  end
end
