class MoreOptionsPage

# initialize variables
	def initialize(driver)
		@driver = driver
		@MoreBuyingOptions_Button =  @driver.link(:id, 'buybox-see-all-buying-choices-announce')
		@AddToCart_Button = @driver.link(:id, 'a-autoid-5')
	end


# Functions
	def MoreOptionsButton_Click
		@MoreBuyingOptions_Button.when_present.click
	end

	def AddToCart_Button_Click
		@AddToCart_Button.when_present.click
	end

end