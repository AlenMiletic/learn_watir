When /^I should see the error message "([^"]*)"$/ do |msg|
  expect(on(CheckoutPage).error_messages).to include msg
end

