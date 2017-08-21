Feature: As a restaurant owner
  In order to get some money
  I need customers to pay on checkout.

Scenario: I check out and pay with my credit card
  Given there is one dish in my cart
  And I am on the "order" page
  When I click the "Pay with Card" stripe button
  And I fill in my card details on the stripe form
  And I submit the stripe form
  Then I should see "Thanks, you paid"
