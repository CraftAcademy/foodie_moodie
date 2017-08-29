Feature: As a user
  In order to decide what dish to choose
  I need to see a list of dishes on the restaurant page with price

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


  Scenario Outline:
    When I visit "restaurant" page
    And I should see "<title>"
    And I should see "<description>"
    And I should see "<price>"

    Examples:
      | title         | description                      | price | category |
      | papadom       | deep fried crunchy things        | 100   | starter  |
      | indian lamb   | lamb with indian spices          | 200   | main     |
      | chicken curry | chicken boiled in curry sauce    | 300   | main     |
      | vegan curry   | vegetables boiled in curry sauce | 400   | main     |
      | choco curry   | Chocolate boiled in curry sauce  | 500   | dessert  |
