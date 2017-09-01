Feature: As a user
  In order to easier find the restaurant I want ot order from
  I need to be able to filter on different cuisines

  Background:
    Given the following restaurants exist:
      | name         | address1        | postal_code | phone_number | city      | cuisine       |
      | Indian Fun   | Sturegatan 12   | 114 36      | 08 662 20 11 | Stockholm | Indian Food   |
      | Italian Fun  | Nybrogatan 16   | 114 39      | 08-661 32 35 | Stockholm | Italian Food  |

  @javascript
  Scenario:
    When I visit "landing" page
    And I click on "Indian Food" in the filter menu
    Then I should see "Indian Fun"
    And I should not see "Italian Fun"
