@javascript @stripe

Feature: As a restaurant owner
  In order to be able to deliver the order
  I require customers to fill in their information before paying

  Background:
    Given the following restaurants exist:
      | name       | address1     | postal_code | phone_number | city  | cuisine     |
      | Indian Fun | Snorgatan 12 | 164 55      | 1234555      | Kista | Indian Food |

    And the following dishes exist
      | title   | description               | price | restaurant |
      | papadom | deep fried crunchy things | 1000  | Indian Fun |

  Scenario: I check out and pay with my credit card
    When I visit "restaurant" page
    And I add "papadom" to order
    And I click on "Show Order"
    Then the "Pay with Card" button should be disabled
    And I should see "Customer Information Must be Filled in"
    And I should be on the order page
