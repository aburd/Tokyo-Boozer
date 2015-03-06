class AddPhoneNumberToStores < ActiveRecord::Migration
  def self.up  
  	change_table :stores do |t|
  		t.string :phone_number
  	end
  end

  def self.down
  	remove_attachment :stores, :phone_number
  end
end
