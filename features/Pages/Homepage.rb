class Homepage

#Create variable with setter and getter 
 	attr_accessor :cart_Icon

# initialize variables
	def initialize(driver)
		@driver = driver
		@url = "https://www.amazon.com/cell-phones-service-plans-accessories/b?ie=UTF8&node=2335752011"
		@Sort_list =  @driver.select_list(:id, 'sort')
		@First_Item = @driver.ul(:id, 's-results-list-atf').li.link
		@Cart_Button = @driver.link(:id, 'hlb-view-cart-announce')
		@cart_Icon = @driver.link(:id, 'nav-cart')
		@batteries_link = @driver.link(:text, "Batteries")

	end


# Functions
	def visit
		@driver.goto @url
	end

	def select_item(item)
		@driver.link(:text, item).when_present.click
	end

	def sort_LowToHigh
		@Sort_list.when_present.select 'Price: Low to High'
	end

	def select_first_item
		@First_Item.when_present.click
	end

	def Cart_Click
		@Cart_Button.when_present.click
	end

	def Click_Batteries
		@batteries_link.when_present.click
	end

end