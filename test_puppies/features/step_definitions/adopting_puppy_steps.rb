def row_for(line)
  (line -1) * 6
end

def cart_line_item(line)
  @browser.table(index: 0)[row_for(line)]
end


Given(/^I am on the puppy adoption site$/) do
  @browser.goto "http://puppies.herokuapp.com"
end

When(/^I click the first View Details button$/) do
  @browser.button(value: "View Details").click
end

When(/^I click the Adopt Me button$/) do
  @browser.button(value: "Adopt Me!").click
end

When(/^I click the Adopt Another Puppy button$/) do
  @browser.button(value: "Adopt Another Puppy").click
end

When(/^I click the second View Details button$/) do
  @browser.button(value: "View Details", index: 1).click
end

When(/^I click the Complete the Adoption button$/) do
  @browser.button(value: "Complete the Adoption").click
end

When(/^I enter "([^"]*)" in the name field$/) do |name|
  @browser.text_field(id: "order_name").set(name)
end

When(/^I enter "([^"]*)" in the address field$/) do |address|
  @browser.textarea(id: "order_address").set(address)
end

When(/^I enter "([^"]*)" in the email field$/) do |email|
  @browser.text_field(id: "order_email").set(email)
end

When(/^I select "([^"]*)" from the pay dropdown$/) do |pay_type|
  @browser.select_list(id: "order_pay_type").select(pay_type)
end

When(/^I click the Place Order button$/) do
  @browser.button(value: "Place Order").click
end

Then(/^I should see "([^"]*)"$/) do |expected|
  expect(@browser.text).to include expected
end

Then(/^I should see "([^"]*)" as the name for line item (\d+)$/) do |name, line|
  row = (line.to_i - 1) * 6
  expect(cart_line_item(line.to_i)[1].text).to include name
end

Then(/^I should see "([^"]*)" as the subtotal for line item (\d+)$/) do |price, line|
  row = (line.to_i - 1) * 6
  expect(cart_line_item(line.to_i)[3].text).to eql price
end

Then(/^I should see "([^"]*)" as the cart total$/) do |total|
  expect(@browser.td(class: "total_cell").text).to eql total
end
