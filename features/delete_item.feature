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
    | indian lamb   | lamb with indian spices          | 200   | Indian Fun |
    | chicken curry | chicken boiled in curry sauce    | 300   | Indian Fun |
    | vegan curry   | vegetables boiled in curry sauce | 400   | Indian Fun |
    | choco curry   | Chocolate boiled in curry sauce  | 500   | Indian Fun |

 And given I see "papadom" and "chicken curry" on the "order" page

Scenario: Delete item from order
  When I click on the "Remove" button next to "papadom"
  Then I should see "chicken curry"
