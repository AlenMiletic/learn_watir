Given("I am on the frames page") do
  visit_page(FramesPage)
end

When("I send the text {string}") do |text|
  on(FramesPage).send_message(text)
end

Then("the receiver should have {string}") do |expected|
  expect(on(FramesPage).receiver).to eql expected
end

When("I popup the alert") do
  on(FramesPage) do |page| 
    @alert_text = page.alert_text
  end
end

Then("the text from the alert should read {string}") do |expected|
  expect(@alert_text).to eql expected
end
