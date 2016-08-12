class CartPage

#Create variable with setter and getter 
	attr_accessor :subTotal_Label
	attr_accessor :cartTitle
	attr_accessor :cartPrice
	attr_accessor :list_of_Cart_Items
	attr_accessor :dollarPrice
	attr_accessor :dollarSubTotal

# initialize variables
	def initialize(driver)
		@driver = driver
		@subTotal_Label = @driver.span(:class, 'a-size-medium a-text-bold').span
		@list_of_Cart_Items = @driver.div(:class,'sc-list-body').divs(:class, 'a-row sc-list-item  sc-list-item-border')
		@dollarPrice = {class: 'a-size-medium a-color-price sc-price sc-white-space-nowrap sc-product-price sc-price-sign a-text-bold'}
		@dollarSubTotal = @driver.div(:class,'sc-subtotal a-text-right a-float-right').span(:class, 'a-size-medium a-color-price sc-price sc-white-space-nowrap  sc-price-sign')
	end


# Functions
	def cartItem_Click(i)
		item = @driver.div(:class, 'sc-list-body').div(:index, i).span(:class, 'a-size-medium sc-product-title a-text-bold').click
	end

	def get_cart_tile(i)
		title = @driver.div(:class, 'sc-list-body').div(:index, i).span(:class, 'a-size-medium sc-product-title a-text-bold')
		return title
	end

	def get_cart_Price(i)
		price = @driver.div(:class, 'sc-list-body').div(:index, i).span(:class, 'a-size-medium a-color-price sc-price sc-white-space-nowrap sc-product-price sc-price-sign a-text-bold')
		return price
	end

	def stripCurrency(string)
		return string.gsub(/[^\d\.]/, '')
	end

end