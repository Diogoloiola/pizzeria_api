class CreateOrderItemRemoveIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :order_item_remove_ingredients, id: :uuid do |t|
      t.references :order_item, null: false, foreign_key: true, type: :uuid
      t.references :remove, null: false, foreign_key: { to_table: :ingredients }, type: :uuid

      t.timestamps
    end
  end
end
