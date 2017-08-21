
Feature: As user
  In order to see my the items in my order
  I need be able display my order page

Background:
  Given the following restaurants exist:
    | name       | address1     | postal_code | phone_number | city  | cuisine     |
    | Indian Fun | Snorgatan 12 | 164 55      | 1234555      | Kista | Indian Food |

  And the following dishes exist
    | title         | description                      | price | restaurant |
    | papadom       | deep fried crunchy things        | 100   | Indian Fun |
    | indian lamb   | lamb with indian spices          | 200   | Indian Fun |
    | chicken curry | chicken boiled in curry sauce    | 300   | Indian Fun |
    | vegan curry   | vegetables boiled in curry sauce | 400   | Indian Fun |
    | choco curry   | Chocolate boiled in curry sauce  | 500   | Indian Fun |

Scenario: Add dish to order
  When I visit "restaurant" page
  And I should be able to see "papadom" on the page
  And I add "papadom" to order
  And I click on "Show Order"
  Then I should be on the "order" page
  And I should see "papadom"

  
