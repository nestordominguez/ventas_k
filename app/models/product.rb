class Product < ActiveRecord::Base
	has_many :line_items
	default_scope { order('title') } #:order => 'title' equivalent to { order('title') }
	validates :title, :presence => true, :uniqueness => true
	validates :description, :presence => true
	var = /\A\w+(.mpg|.gif|.jpg|.png)+\z/i
	validates :image_url, format: { with: var}, :presence => true
	validates :price, :numericality => {:greater_than_or_equal_to => 0.01},
			:presence => true
	validates :stock, :numericality => {:greater_than_or_equal_to => 0},
			:presence => true
	before_destroy :ensure_not_referenced_by_any_line_item
	private

		def ensure_not_referenced_by_any_line_item
			return true if line_items.empty?
			errors.add(:base, 'Line Items present')
			false
		end
end
