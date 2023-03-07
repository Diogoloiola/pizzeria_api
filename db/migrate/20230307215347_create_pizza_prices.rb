class CreatePizzaPrices < ActiveRecord::Migration[7.0]
  def change
    create_table :pizza_prices, id: :uuid do |t|
      t.integer :size, null: false
      t.decimal :value, null: false
      t.references :pizza, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
