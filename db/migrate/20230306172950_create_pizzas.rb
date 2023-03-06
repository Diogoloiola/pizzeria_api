class CreatePizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :pizzas, id: :uuid do |t|
      t.string :name
      t.float :value, precision: 10, scale: 2
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :pizzas, :name, unique: true
  end
end
