class AddActiveToSeller < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :active, :boolean, default: false
  end
end
