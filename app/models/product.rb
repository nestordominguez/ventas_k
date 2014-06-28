class Product < ActiveRecord::Base
	default_scope :order => 'title'
	validates :title, :presence => true, :uniqueness => true
	validates :description, :presence => true
	var = /\A\w+(.mpg|.gif|.jpg|.png)+\z/i
	validates :image_url, format: { with: var}, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01},
			:presence => true
	validates :stock, :numericality => {:greater_than_or_equal_to => 0},
			:presence => true
end
