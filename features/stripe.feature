@javascript @stripe

Feature: As a restaurant owner
  In order to get some money
  I need customers to pay on checkout.

  Background:
    Given the following restaurants exist:
      | name       | address1     | postal_code | phone_number | city  | cuisine     |
      | Indian Fun | Snorgatan 12 | 164 55      | 1234555      | Kista | Indian Food |

    And the following dishes exist
      | title   | description               | price  | restaurant |
      | papadom | deep fried crunchy things | 1000   | Indian Fun |

  Scenario: I check out and pay with my credit card
    When I visit "restaurant" page
    And I add "papadom" to order
    And I click on "Show Order"
    Then I should be on the order page
    And I enter in my personal information
    And I click the "Pay with Card" stripe button
    And I fill in my card details on the stripe form
    And I submit the stripe form
    Then I should see "Thanks, you paid 1000.00 sek!"
    And I should see "Including VAT. (12%): 107.10 sek"
    And I should see "papadom"
    Then the order should be payed for
    Then Order items in cart should be "0"
