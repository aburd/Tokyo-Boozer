class AddStoreIdToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :store_id, :integer
  end
end
