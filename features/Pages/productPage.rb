class ProductPage

#Create variable with setter and getter 
	attr_accessor :subTotal_Label
	attr_accessor :cartTitle
	attr_accessor :cartPrice
	attr_accessor :productTitle
	attr_accessor :productPrice

# initialize variables
	def initialize(driver)
		@driver = driver
		@productTitle = @driver.span(:id, 'productTitle')
		@productPrice = @driver.span(:class, 'a-color-price')
		@addToCart_Button = @driver.button(:id, 'add-to-cart-button')
	end


# Functions
	def cartItem_Click
		@cartItem.click
	end

	def Click_AddToCartButton
		@addToCart_Button.click
	end

end