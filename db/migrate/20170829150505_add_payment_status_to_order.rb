class AddPaymentStatusToOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :payed, :boolean, default: false
  end
end
