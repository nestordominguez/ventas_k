class Product < ActiveRecord::Base
	validates :title, :description, :image_url, :stock, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01},
			:presence => true
	validates :title, :uniqueness => true
	validates :stock, :numericality => {:greater_than_or_equal_to => 0}
	#validates :image_url, format: {}
end
