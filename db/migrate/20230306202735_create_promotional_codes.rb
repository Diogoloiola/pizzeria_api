class CreatePromotionalCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :promotional_codes, id: :uuid do |t|
      t.string :code, null: false, default: ''
      t.references :target, null: false, foreign_key: { to_table: :pizzas }, type: :uuid
      t.integer :size
      t.integer :from
      t.integer :to
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
