Given /^I have a pending adoption for "([^"]*)"$/ do |name|
  order = build(:order, name: name)
  create(:adoption, order: order)
end

When /^I process that adoption$/ do 
  visit(LandingPage) 
  on(LoginPage).login_to_system 
  on(LandingPage).adoptions 
  on(ProcessPuppyPage).process_first_puppy
end
