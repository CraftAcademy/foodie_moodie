Feature: As a user
  I order to decide what to order
  I need to see the dishes according to dish category

Background:
  Given the following restaurants exist:
      | name       | address1     | postal_code | phone_number | city  | cuisine     |
      | Indian Fun | Snorgatan 12 | 164 55      | 1234555      | Kista | Indian Food |

  And the following dishes exist:
    | title         | description                      | price | restaurant |
    | papadom       | deep fried crunchy things        | 100   | Indian Fun |
    | indian lamb   | lamb with indian spices          | 200   | Indian Fun |
    | chicken curry | chicken boiled in curry sauce    | 300   | Indian Fun |
    | vegan curry   | vegetables boiled in curry sauce | 400   | Indian Fun |
    | choco curry   | Chocolate boiled in curry sauce  | 500   | Indian Fun |

Scenario:
  When I visit "restaurant" page
  And I should see "category"
