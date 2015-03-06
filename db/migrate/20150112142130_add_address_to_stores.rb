class AddAddressToStores < ActiveRecord::Migration
  def self.up  
  	change_table :stores do |t|
  		t.string :address
  	end
  end

  def self.down
  	remove_attachment :stores, :address
  end
end
