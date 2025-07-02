class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :profile_picture, :string
    add_column :users, :billing_address, :text
    add_column :users, :country_of_residence, :string
    add_column :users, :province, :string
    add_column :users, :city_of_residence, :string
    add_column :users, :street_and_number, :string
    add_column :users, :postal_code, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :gender, :string
  end
end
