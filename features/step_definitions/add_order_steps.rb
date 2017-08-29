require 'factory_girl_rails'

 Given(/^the following dishes exist$/) do |table|
   table.hashes.each do |hash|
     restaurant = Restaurant.find_by(name: hash[:restaurant])
     FactoryGirl.create(:dish, hash.except!(:restaurant).merge!({restaurant: restaurant}))
   end
 end

 When(/^I should be able to see "([^"]*)" on the page$/) do |content|
 expect(page).to have_content content
end

When(/^I add "([^"]*)" to order$/) do |dish_title|
  add_button_with_id = Dish.find_by(title: dish_title).id
  click_link_or_button add_button_with_id
end

Then(/^Order items in cart should be "([^"]*)"$/) do |expected_count|
  within '#order_item' do
    expect(page).to have_content expected_count
  end
end

Then(/^I should be on the "([^"]*)" page$/) do |arg1|
  order = Order.last
  expect(page).to have_current_path order_path(order)
end
