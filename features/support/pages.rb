class Pages

 #Create pages into glocal variables (Page Object)
	attr_accessor :homepage
	attr_accessor :moreOptionsPage
	attr_accessor :cartPage
	attr_accessor :productPage


  #Initialize pages (Page Object)
	def initialize driver
		@driver = driver
		@homepage = Homepage.new driver
		@moreOptionsPage = MoreOptionsPage.new driver
		@cartPage = CartPage.new driver
		@productPage = ProductPage.new driver
	end

end