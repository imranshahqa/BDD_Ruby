Feature: Search and AddToCart cheapest iPhone and Accessory
	
	@Ready
	Scenario: Item price and cost in cart
		Given i am on the amazon homage 
		When I add the cheapest "iPhone 6/6s and 6/6s Plus" to the cart
		Then the cost and title of the "1st" item in the cart is correct
	
	@Ready
	Scenario: Check subtotal
		Given i am on the amazon homage 
		When I add the cheapest "iPhone 6/6s and 6/6s Plus" to the cart
		And I go to the cart
		Then the subtotal text shows 'Subtotal (1 item):'

	@Ready
	Scenario: Add To Cart cheapeast iPhone and Accessory
		Given i am on the amazon homage 
		And I add the cheapest "iPhone 6/6s and 6/6s Plus" to the cart
		And I add the cheapest Accessory to the cart
		When I go to the cart
		Then the total should be the sum of the items in the cart

