class AddPictureColumnsToStores < ActiveRecord::Migration
  def self.up  
  	change_table :stores do |t|
  		t.attachment :picture
  	end
  end

  def self.down
  	remove_attachment :stores, :picture
  end
end
