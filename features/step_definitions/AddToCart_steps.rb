Given(/^i am on the amazon homage$/) do
  @app.homepage.visit
end

When(/^I add the cheapest "(.*)" to the cart$/) do |item|
  @app.homepage.visit
  @app.homepage.select_item(item)
  @app.homepage.sort_LowToHigh
  @app.homepage.select_first_item
  @app.moreOptionsPage.MoreOptionsButton_Click

  # Add to Cart
  @app.moreOptionsPage.AddToCart_Button_Click
end


When(/^I go to the cart$/) do
  # click on cart
  @app.homepage.Cart_Click
end


Then(/^the subtotal text shows '(.*)'$/) do |subtotal|
  expect(@app.cartPage.subTotal_Label.text).to eq(subtotal)
end

Then(/^the cost and title of the "(\d).." item in the cart is correct$/) do |index|
  @app.homepage.Cart_Click

	i = index.to_i
  i = i - 1

  # Get title and cost from list
  cart_title = @app.cartPage.get_cart_tile(i).text
  cart_price = @app.cartPage.get_cart_Price(i).text

  # Click on the item in the cart
  @app.cartPage.cartItem_Click(i)
  product_price = @app.productPage.productPrice.text

	expect(product_title).to eq(cart_title)
	expect(product_price).to eq(cart_price)
end

Given(/^I add the cheapest Accessory to the cart$/) do
  @app.homepage.visit
  @app.homepage.Click_Batteries
  @app.homepage.sort_LowToHigh
  @app.homepage.select_first_item
  @app.productPage.Click_AddToCartButton
end

Then(/^the total should be the sum of the items in the cart$/) do
  total = 0.00
  list = @app.cartPage.list_of_Cart_Items
  list.each do |item|
    price_with_dollar = item.span(@app.cartPage.dollarPrice).text
    price_Without_dollar = @app.cartPage.stripCurrency(price_with_dollar).to_f
    puts total = total + price_Without_dollar
  end

  subtotal_with_dollar = @app.cartPage.dollarSubTotal.text
  subtotal_without_dollar = @app.cartPage.stripCurrency(subtotal_with_dollar).to_f
  expect(subtotal_without_dollar).to eq(total)
  puts "this is the total =$"+total.to_s
end

