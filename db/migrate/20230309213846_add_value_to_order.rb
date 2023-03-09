class AddValueToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :value, :decimal, precision: 10, scale: 2
  end
end
