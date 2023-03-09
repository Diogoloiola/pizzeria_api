class CreateOrderPromotionalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :order_promotional_codes, id: :uuid do |t|
      t.references :order, null: false, foreign_key: true, type: :uuid
      t.references :promotional_code, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
