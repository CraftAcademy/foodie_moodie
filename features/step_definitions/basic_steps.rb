Then(/^I should see "([^"]*)"$/) do |content|
  expect(page).to have_content content
end

Then(/^I should not see "([^"]*)"$/) do |content|
  expect(page).not_to have_content content
end

When(/^I fill "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in field, with: content
end

When(/^I click on "([^"]*)"$/) do |link|
  click_link_or_button link
end

Then(/^Show me a image of the page$/) do
  sleep(1)
  Capybara::Screenshot.screenshot_and_open_image
end

When(/^show me the page$/) do
  save_and_open_page
end

And(/^I click on "([^"]*)" in the filter menu$/) do |button_name|
  sleep(0.5)
  first(:button, button_name).click
end