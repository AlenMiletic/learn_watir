Given("I am on the google DynaTable Example page") do
  visit_page(DynaTablePage)
end

When("I select the schedule for {string}") do |day_of_week|
  on(DynaTablePage).select_schedule_for day_of_week
end

Then("I should see that {string} has a class at {string}") do |name, schedule|
  expect(on(DynaTablePage).class_schedule_for(name)).to include schedule
end
