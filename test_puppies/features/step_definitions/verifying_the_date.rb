Then /^the adoption delivered on date should be set to the current time$/ do
  adoption = Adoption.first
  expect(adoption.delivered_on).to be_on_or_near_the_time (Time.now)
end
