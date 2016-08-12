require "rspec/expectations"
require "watir-webdriver"
require 'watir-webdriver'
require_relative "./pages.rb" 

Before do |scenario|					#Before every scenerio- launch the bowser, set the wait to 3 seconds and creates an object for Pages (Page Object)
	@driver = Watir::Browser.new :firefox
	@driver.driver.manage.timeouts.implicit_wait = 3 #3 seconds
	@app = Pages.new @driver
end

After do |scenario|						#After every scenerio- close the webdriver which also closes the browser
	@driver.close
end

at_exit do								#When test suite finishes, webdriver gets closed 
	@driver.close
end
