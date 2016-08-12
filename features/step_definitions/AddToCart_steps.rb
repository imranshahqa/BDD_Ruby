Given(/^I am on the amazon hompage$/) do
  @app.homepage.visit                                  #Go to Amazon website
end

When(/^I add the cheapest "(.*)" to the cart$/) do |item|
  @app.homepage.visit                                  #Go to Amazon website
  @app.homepage.select_item(item)                      #Select the Phones Category
  @app.homepage.sort_LowToHigh                         #Sort the search by Price:Low To High
  @app.homepage.select_first_item                      #Select the first item from the search
  @app.moreOptionsPage.MoreOptionsButton_Click         #Go to more buying options
  @app.moreOptionsPage.AddToCart_Button_Click          # Add to Cart
end


When(/^I go to the cart$/) do
  @app.homepage.Cart_Click                             #Go To Cart
end


Then(/^the subtotal text shows '(.*)'$/) do |subtotal|
  expect(@app.cartPage.subTotal_Label.text).to eq(subtotal)   #Verify item is added to cart
end

Then(/^the cost and title of the "(\d).." item in the cart is correct$/) do |index|
  @app.homepage.Cart_Click                            #Got to cart

	i = index.to_i                                      #Used to locate the the elemnt from a list
  i = i - 1

  cart_title = @app.cartPage.get_cart_tile(i).text    #Get title of the item from the list
  cart_price = @app.cartPage.get_cart_Price(i).text   #Get price of the item from the list

  @app.cartPage.cartItem_Click(i)                     #Go to the item from the cart
  product_title = @app.productPage.productTitle.text  #Get title of the item
  product_price = @app.productPage.productPrice.text  #Get price of the item

	expect(product_title).to eq(cart_title)             #Verify title is correct as expected
	expect(product_price).to eq(cart_price)             #Verify title is correct as expected
end

Given(/^I add the cheapest Accessory to the cart$/) do
  @app.homepage.visit                                  #Go to Amazon website
  @app.homepage.Click_Batteries                        #Go to Batteries under Accessories
  @app.homepage.sort_LowToHigh                         #Sort the search by Price:Low To High
  @app.homepage.select_first_item                      #Select the first item from the search
  @app.productPage.Click_AddToCartButton               # Add to Cart
end

Then(/^the total should be the sum of the items in the cart$/) do
  total = 0.00
  list = @app.cartPage.list_of_Cart_Items                                         #Get list of items in the cart
  list.each do |item|
    price_with_dollar = item.span(@app.cartPage.dollarPrice).text                 #Get individual item price with currency symbol
    price_Without_dollar = @app.cartPage.stripCurrency(price_with_dollar).to_f    #Remove currency symbol from the price and convert it to float
    total = total + price_Without_dollar                                          #Get total
  end

  subtotal_with_dollar = @app.cartPage.dollarSubTotal.text                            #Get the subtotal amount of the cart
  subtotal_without_dollar = @app.cartPage.stripCurrency(subtotal_with_dollar).to_f    #Remove currency symbol from the subtotal amount of the cart and convert it to float
  expect(subtotal_without_dollar).to eq(total)                                        #Verify the cart total matches the total value of the items added to cart
  puts "this is the total =$"+total.to_s                                              #Prints the total amount on screen
end

