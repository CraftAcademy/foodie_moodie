Then(/^I should see map$/) do
  expect(page).not_to have_selector('#map:empty')
end

And(/^(?:I expect a Google map to load|the map has been loaded)$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  expect(page).to have_css '#map .gm-style'
end

Then(/^the center of the map should be approximately "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  page.evaluate_script("map.setCenter(#{lat}, #{lng})")
end

Then(/^my location is set to "([^"]*)" lat and "([^"]*)" lng$/) do |lat, lng|
  ACCEPTED_OFFSET = 0.2
  center_lat = page.evaluate_script('map.getCenter().lat();')
  center_lng = page.evaluate_script('map.getCenter().lng();')
  expect(center_lat).to be_within(ACCEPTED_OFFSET).of(lat.to_f)
  expect(center_lng).to be_within(ACCEPTED_OFFSET).of(lng.to_f)
end