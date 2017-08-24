class AddCustomerFieldsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :address1, :string
    add_column :orders, :address2, :string
    add_column :orders, :postal_code, :string
    add_column :orders, :city, :string
    add_column :orders, :phone_number, :string
    add_column :orders, :email, :string
  end
end
