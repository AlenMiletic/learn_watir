Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  navigate_to(CheckoutPage).checkout('name' => name)
end
When /^I process that adoption$/ do 
  visit(LandingPage) 
  on(LoginPage).login_to_system 
  on(LandingPage).adoptions 
  on(ProcessPuppyPage).process_first_puppy
end
