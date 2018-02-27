Given(/^I am on the puppy adoption site$/) do
  visit(HomePage)
end

DataMagic.load("the_other_file.yml")

When(/^I click the View Details button for "([^"]*)"$/) do |name|
  sleep 2
  on(HomePage).select_puppy name
end

When(/^I click the Adopt Me button$/) do
  sleep 2
  on(DetailsPage).add_to_cart
end

When(/^I click the Adopt Another Puppy button$/) do
  sleep 2
  on(ShoppingCartPage).continue_shopping
end

When /^I complete the adoption with:$/ do |table|
  on(CheckoutPage).checkout(table.hashes.first)
end

When /^I complete the adoption using a Credit card$/ do
  on(CheckoutPage).checkout("pay_type" => "Credit card")
  sleep 2
end

When /^I complete the adoption$/ do
  on(CheckoutPage).checkout
end

When /^I complete the adoption of a puppy$/ do
  navigate_all
end

When /^I checkout leaving the name field blank$/ do
  navigate_to(CheckoutPage).checkout("name" => "")
end

When(/^I click the Complete the Adoption button$/) do
  sleep 2
  on(ShoppingCartPage).proceed_to_checkout
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  sleep 2
  on(CheckoutPage).name = name
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  on(CheckoutPage).address = address
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  on(CheckoutPage).email = email
end

When(/^I select "([^"]*)" from the pay dropdown$/) do |pay_type|
  on(CheckoutPage).pay_type = pay_type
end

When(/^I click the Place Order button$/) do
  sleep 2 
  on(CheckoutPage).place_order
end

Then(/^I should see "([^"]*)"$/) do |expected|
  sleep 2
  expect(@current_page.text).to include expected
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line_item|
  sleep 2
  expect(on(ShoppingCartPage).name_for_line_item(line_item)).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |subtotal, line_item|
  expect(on(ShoppingCartPage).subtotal_for_line_item(line_item)).to eql subtotal
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(on(ShoppingCartPage).cart_total).to eql total
end

