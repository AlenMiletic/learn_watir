Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
  @home = HomePage.new(@browser)
end

When(/^I click the first View Details button$/) do
  sleep 2
  on(HomePage).select_puppy_number 1
  @details = DetailsPage.new(@browser)
end

When(/^I click the Adopt Me button$/) do
  sleep 2
  @cart = ShoppingCartPage.new(@browser)
  @details.add_to_cart
end

When(/^I click the Adopt Another Puppy button$/) do
  sleep 2
  @cart.continue_shopping
end

When(/^I click the second View Details button$/) do
  sleep 2
  @home.select_puppy_number 2
  @details = DetailsPage.new(@browser)
end

When(/^I click the Complete the Adoption button$/) do
  sleep 2
  @cart.proceed_to_checkout
  @checkout = CheckoutPage.new(@browser)
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  sleep 2
  @checkout.name = name
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  @checkout.address = address
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  @checkout.email = email
end

When(/^I select "([^"]*)" from the pay dropdown$/) do |pay_type|
  @checkout.pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  sleep 2 
  @checkout.place_order
end

Then(/^I should see "([^"]*)"$/) do |expected|
  sleep 2
  expect(@browser.text).to include expected
end

Then(/^I should see "([^"]*)" as the name for (line item \d+)$/) do |name, line_item|
  sleep 2
  expect(@cart.name_for_line_item(line_item)).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for (line item \d+)$/) do |price, line_item|
  expect(@cart.subtotal_for_line_item(line_item)).to eql price
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(@cart.cart_total).to eql total
end
