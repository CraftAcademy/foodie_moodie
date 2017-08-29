When(/^I remove "([^"]*)" from order$/) do |dish_title|
  del_button_with_id = Dish.find_by(title: dish_title).id
  click_link_or_button 'del_' + del_button_with_id.to_s
end
