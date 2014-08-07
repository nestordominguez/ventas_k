require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "product attributes must not be empty" do
  	product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:price].any?
		assert product.errors[:image_url].any?
  end
  test "test title" do
  	product = Product.new(
  				:description => "asd",
  				:image_url => "asd.jpg",
  				:price => 1,
  				:stock => 1)
  	product.title = ""
  	assert product.invalid?, "product title must be present"
  	product.title = "MyString"
  	assert product.invalid?, "product title must be uniqueness"
  end

  test "product description must be present" do
  	product = Product.new(:title => "My book",
  				:image_url => "asd.jpg",
  				:price => 1,
  				:stock => 1)
  	product.description = ""
  	assert product.invalid?
  	assert_equal "can't be blank", 
  		product.errors[:description].join('; ')
  end

  test "product image" do
  	product = Product.new(:title => "My book",
  				:description => "asd",
  				:price => 1,
  				:stock => 1)  	
  	product.image_url = "asd.gif" || "asd.jpg" || "asd.mpg" || "asd.png"
  	assert product.valid?
  	product.image_url = "asd.asd"
  	assert product.invalid?, "must be gif, jpg, mpg o png"
  	product.image_url = ""
  	assert product.invalid? 
  	assert_equal "is invalid; can't be blank", 
  		product.errors[:image_url].join('; ')
  end

  test "product price must be positive" do
  	product = Product.new(:title => "My book",
  				:description => "asd",
  				:image_url => "asd.jpg",
  				:stock => 1)
  	product.price = -1
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0.01",
		product.errors[:price].join('; ')
	product.price = 0
	assert product.invalid?
	assert_equal "must be greater than or equal to 0.01",
		product.errors[:price].join('; ')
	product.price = 1
	assert product.valid?
  end
  test "product stock must be greater than 0" do
  	product = Product.new(:title => "My book",
  				:description => "asd",
  				:image_url => "asd.jpg",
  				:price => 1)
  	product.stock = 0
  	assert product.valid?
	product.stock = -1
  	assert product.invalid?
  	assert_equal "must be greater than or equal to 0",
		product.errors[:stock].join('; ')
	product.stock = 1
  	assert product.valid?
  end
end
