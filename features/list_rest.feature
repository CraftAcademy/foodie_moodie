Feature: As a user
  In order to see what kind of food you can choose from
  I need to see a list of restaurants

  Background:
    Given the following restaurants exist:
      | name         | address1        | postal_code | phone_number | city      | cuisine       |
      | Indian Fun   | Sturegatan 12   | 114 36      | 08 662 20 11 | Stockholm | Indian Food   |
      | Italian Fun  | Nybrogatan 16   | 114 39      | 08-661 32 35 | Stockholm | Italian Food  |
      | Chinese Fun  | Potatisgatan 20 | 164 55      | 0484658      | Kista     | Chinese Food  |
      | American Fun | Snigelgatan 69  | 164 55      | 0735465      | Kista     | American Food |

  Scenario Outline:
    When I visit "landing" page
    And I should see "<name>"
    And I should see "<address1>, <postal_code> <city>"
    And I should see "<phone_number>"
    And I should see "<cuisine>"
    And I click on "Indian Fun"
    Then I should see "Indian Fun"

    Examples:
      | name         | address1        | postal_code | phone_number | city      | cuisine       |
      | Indian Fun   | Sturegatan 12   | 114 36      | 08 662 20 11 | Stockholm | Indian Food   |
      | Italian Fun  | Nybrogatan 16   | 114 39      | 08-661 32 35 | Stockholm | Italian Food  |
