class AddAddressToSettings < ActiveRecord::Migration[7.1]
  def change
    add_column :settings, :address, :text
  end
end
