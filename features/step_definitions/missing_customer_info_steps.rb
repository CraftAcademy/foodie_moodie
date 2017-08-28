Then(/^the "([^"]*)" button should be disabled$/) do |button|
  element_status = find('button', text: button)['disabled']
  expect(element_status).to eq true
end

Then(/^the "([^"]*)" button should be enabled$/) do |button|
  element_status = find('button', text: button)['disabled']
  expect(element_status).to eq false
end
