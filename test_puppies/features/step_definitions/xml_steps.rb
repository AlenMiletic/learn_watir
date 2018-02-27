When("I open my shows xml") do
  file = File.open('shows.xml')
  @xml = Nokogiri::XML(file)
  file.close
end

Then("I should see {int} sitcoms") do |number_of_sitcoms|
  expect(@xml.xpath('//sitcom').length).to eql number_of_sitcoms
end

Then("I should see {int} drama") do |number_of_dramas|
  expect(@xml.xpath('//drama').length).to eql number_of_dramas
end
