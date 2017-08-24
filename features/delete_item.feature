Feature: As a user,
  In order to adjust my order,
  I need to be able to delete items from my cart

Background:
  Given the following restaurants exist:
    | name       | address1     | postal_code | phone_number | city  | cuisine     |
    | Indian Fun | Snorgatan 12 | 164 55      | 1234555      | Kista | Indian Food |

  And the following dishes exist
    | title         | description                      | price | restaurant |
    | papadom       | deep fried crunchy things        | 100   | Indian Fun |
    | chicken curry | chicken boiled in curry sauce    | 300   | Indian Fun |


Scenario: Delete item from order
When I visit "restaurant" page
And I add "papadom" to order
And I add "chicken curry" to order
And I click on "Show Order"
And I remove "papadom" from order
Then I should see "papadom was successfully removed"
When I click on "Show Order"
Then I should not see "papadom"
And I should see "chicken curry"
