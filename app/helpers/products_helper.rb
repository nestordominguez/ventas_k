module ProductsHelper
	def value
		@product.stock || 1
	end
end
