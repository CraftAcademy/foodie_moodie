
When(/^I click the "([^"]*)" stripe button$/) do |button|
  sleep(0.2)
  find('.stripe-button-el').trigger('click')
end

When(/^I fill in my card details on the stripe form$/) do
  sleep(0.1) until page.evaluate_script('$.active') == 0
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

When(/^I submit the stripe form$/) do
  order = Order.last
  within_frame @stripe_iframe do
    click_button "Pay $#{order.total.to_i}"
  end
  sleep(1)
end
