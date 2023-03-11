class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders, id: :uuid do |t|
      t.integer :status, null: false, default: 0
      t.string :discount_code

      t.timestamps
    end
  end
end
