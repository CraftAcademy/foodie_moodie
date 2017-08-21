Given(/^the following categories of dishes exist:$/) do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:category, hash)
  end
end

Given(/^the following dishes exist:$/) do |table|
  table.hashes.each do |hash|
    restaurant = Restaurant.find_by(name: hash[:restaurant])
    FactoryGirl.create(:dish, hash.except!(:restaurant).merge!({restaurant: restaurant}))
  end
end

When(/^I visit "([^"]*)" page$/) do |page|
  case page
    when 'landing'
      visit root_path
    when 'restaurant'
      restaurant = Restaurant.find_by(name: 'Indian Fun')
      visit restaurant_path(restaurant)
    when 'Order'
      visit orders_path
  end
end

When(/^I click on "([^"]*)"$/) do |link|
  click_link_or_button link
end

Then(/^I should be redirected to "([^"]*)" page$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end
