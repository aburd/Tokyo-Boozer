class RemoveAddressFromStores < ActiveRecord::Migration
  def change
    change_table :stores do |t|
    	t.remove :address
    	t.remove :latitude
    	t.remove :longitude
  	end
  end
end
