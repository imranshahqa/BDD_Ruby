require "rspec/expectations"
require "watir-webdriver"
require 'watir-webdriver'
require_relative "./pages.rb" 

Before do |scenario|
	@driver = Watir::Browser.new :firefox
	@driver.driver.manage.timeouts.implicit_wait = 3 #3 seconds
	@app = Pages.new @driver
end

After do |scenario|
	@driver.close
end

at_exit do
	@driver.close
end
