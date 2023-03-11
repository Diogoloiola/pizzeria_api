class AddSellerToOrder < ActiveRecord::Migration[7.0]
  def change
    add_reference :orders, :seller, null: true, foreign_key: true, type: :uuid
  end
end
