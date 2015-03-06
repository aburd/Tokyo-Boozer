class Location < ActiveRecord::Base

	belongs_to :store, foreign_key: "store_id"

	validates :address, presence: true

end
