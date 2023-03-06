class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients, id: :uuid do |t|
      t.string :name
      t.float :multiplier, precision: 10, scale: 2
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
