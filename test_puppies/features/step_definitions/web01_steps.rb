Given("I am on the frames page") do
  visit_page(FramesPage)
end

When("I send the text {string}") do |text|
  on(FramesPage).send_message(text)
end

Then("the receiver should have {string}") do |expected|
  expect(on(FramesPage).receiver).to eql expected
end
