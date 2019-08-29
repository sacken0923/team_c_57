class AddKanaAddressFirstNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kana_address_first_name, :string
  end
end
