When /^I should see the error message "([^"]*)"$/ do |msg|
  expect(@current_page.error.messages).to include msg
end

