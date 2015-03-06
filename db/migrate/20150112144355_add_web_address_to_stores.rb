class AddWebAddressToStores < ActiveRecord::Migration
  def self.up  
  	change_table :stores do |t|
  		t.string :web_address
  	end
  end

  def self.down
  	remove_attachment :stores, :web_address
  end
end
