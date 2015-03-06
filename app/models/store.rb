class Store < ActiveRecord::Base

  has_many :locations, dependent: :destroy
  accepts_nested_attributes_for :locations

  def self.search(search)
    search_condition = "%" + search + "%"
    where("name like ? or description like ?", search_condition, search_condition)
  end


	before_validation :regularize_phone_number

	def regularize_phone_number
		self.phone_number = phone_number.gsub(/[^0-9]/, "")
	end

  	has_attached_file 	:picture, 
  						:styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  						url: "/assets/images/stores/:id/:style/:basename.:extension",
  						path: "/:rails_root/public/assets/images/stores/:id/:style/:basename.:extension",
  						:default_url => "/missing.png"
  	validates :web_address, presence: true
  	validates :description, presence: true,
  							length: { minimum: 15 }	
  	validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/
  	
  	validates :name, presence: true,
					 length: { minimum: 3 }
  	
  	validates :phone_number, presence: true,
  							 length: { is: 10 }
end
