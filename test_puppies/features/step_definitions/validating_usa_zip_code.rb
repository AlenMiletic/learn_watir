When("I ask the service for the supported operations") do
 @operations = using(ZipCodeInformationService).operations
end

Then("{string} should be supported") do |operation|
  expect(@operations).to include operation.to_sym
end

When("I ask for the zip code information for {string}") do |zip_code|
  using(ZipCodeInformationService).get_info_by_zip('USZip' => zip_code)
end

Then("I should get the following information:") do |table|
  expected = table.hashes.first
  using(ZipCodeInformationService) do |service|
    expect(service.response_for(:city)).to eql expected['city']
    expect(service.response_for(:state)).to eql expected['state']
    expect(service.response_for(:area_code)).to eql expected['area_code']
    expect(service.response_for(:time_zone)).to eql expected['time_zone']
  end
end

