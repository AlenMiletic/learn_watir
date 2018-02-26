Given /^I know how many orders I have$/ do
  @number_orders  = Order.count
end

When /^I create a new order$/ do
  create(:order)
end

Then /^I should have (\d+) additional order$/ do |int|
  expect(Order.count).to_eql @number_orders + additional_orders.to_i
end

Given /^I have an order for "([^"]*)"$/ do |name|
  create(:order, name: name)
  @riginal_name = name
end

When /^I read that order$/ do
  @order = Order.find_by_name(@original_name)
end

Then /^the order should have the name "([^"]*)"$/ do |name|
  expect(@order.name).to eql name
end

When /^I update the name to "([^"]*)"$/ do |name|
  order = Order.find_by_name(@original_name)
  order.name = name
  order.save
end

Then /^I should not have a record for "([^"]*)"$/ do |name|
  order = Order.find_by_name(name)
  expect(order).to be_nil
end

Then /^I should have a record for "([^"]*)"$/ do |name|
  order = Order.find_by_name(name)
  expect(order).to_not be_nil
end

When /^I delete that order$/ do
  order = Order.find_by_name(@original_name)
  order.delete
end
