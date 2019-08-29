class AddKanaAddressLastNameToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :kana_address_last_name, :string
  end
end
