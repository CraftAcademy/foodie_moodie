Feature: As a user
  In order to select a restaurant that delivers to my location
  I need to be able to enter my location and see a list of this restaurants.

  Background:
    Given the following restaurants exist:
      | name         | address1        | postal_code | phone_number | city  | cuisine       |
      | Indian Fun   | Snorgatan 12    | 164 55      | 1234555      | Kista | Indian Food   |
      | Italian Fun  | Leyongatan 14   | 164 55      | 8462956      | Kista | Italian Food  |
      | Chinese Fun  | Potatisgatan 20 | 164 55      | 0484658      | Kista | Chinese Food  |
      | American Fun | Snigelgatan 69  | 164 55      | 0735465      | Kista | American Food |

  @javascript
  Scenario:
    When I visit "landing" page
    And my location is set to "59.33066" lat and "11.057932" lng
    Then the center of the map should be approximately "59.33066" lat and "11.057932" lng
