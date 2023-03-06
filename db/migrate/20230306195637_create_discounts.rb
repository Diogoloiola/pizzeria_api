class CreateDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts, id: :uuid do |t|
      t.float :deduction_in_percent, precision: 10, scale: 2
      t.boolean :active, default: true
      t.string :code, null: false, defaut: ''
      t.timestamps
    end
  end
end
