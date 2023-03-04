class ChangeIdToUuidSeller < ActiveRecord::Migration[7.0]
  def change
    add_column :sellers, :uuid, :uuid, default: 'uuid_generate_v4()', null: false

    change_table :sellers do |t|
      t.remove :id
      t.rename :uuid, :id
    end
    execute 'ALTER TABLE sellers ADD PRIMARY KEY (id);'
  end
end
