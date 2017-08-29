When /^I should see the error message "([^"]*)"$/ do |msg|
  expect(@current_page).to have_error_message msg
end

