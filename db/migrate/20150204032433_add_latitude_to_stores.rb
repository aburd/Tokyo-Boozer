class AddLatitudeToStores < ActiveRecord::Migration
  def self.up  
  	change_table :stores do |t|
  		t.float :latitude
  		t.float :longitude
  	end
  end

  def self.down
  	remove_attachment :latitude, :longitude
  end
end
