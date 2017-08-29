When(/^I click the "([^"]*)" stripe button$/) do |button|
  sleep(0.2)
  find('.stripe-button-el').trigger('click')
end

When(/^I fill in my card details on the stripe form$/) do
  sleep(5)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

And(/^I enter in my personal information$/) do
  fill_in 'name', with: 'random name'
  fill_in 'address_1', with: 'street 1'
  fill_in 'address_2', with: 'c/o my home'
  fill_in 'postal_code', with: '12345'
  fill_in 'city', with: 'Farsta'
  fill_in 'email', with: 'email@dummy.com'
  fill_in 'phone_number', with: '+461234567'
end

When(/^I submit the stripe form$/) do
  within_frame @stripe_iframe do
    page.execute_script("$('button').click();")
  end
  sleep(5)
end

Then(/^the order should be payed for$/) do
  @order.reload
  expect(@order.payed).to eq true
end