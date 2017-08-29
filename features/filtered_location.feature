@javascript
Feature: As a user
  In order to select a restaurant that delivers to my location
  I need to be able to enter my location and see a list of this restaurants.

  Background:
    Given the following restaurants exist:
      | name             | address1           | postal_code | phone_number | city      |
      | Vapiano          | Sturegatan 12      | 114 36      | 08 662 20 11 | Stockholm |
      | Rice             | Nybrogatan 16      | 114 39      | 08-661 32 35 | Stockholm |
      | Green & Rum      | Östra Hamngatan 16 | 411 09      | 031-15 09 00 | Göteborg  |
      | Tandoori Kitchen | Friggagatan 15     | 411 01      | 031-23 09 19 | Göteborg  |

  Scenario: Landing page displayes restaurants based on location from IP address
    When I visit "landing" page
    Then I should see "Vapiano"
    And I should see "Rice"
    And I should not see "Green & Rum"
    And I should not see "Tandoori Kitchen"

  Scenario: from manual input of address in search field
    When I visit "landing" page
    And I fill "search" with "Gruvgatan 1, Västra Frölunda"
    And I click on "Search Near"
    Then I should not see "Vapiano"
    And I should not see "Rice"
    And I should see "Green & Rum"
    And I should see "Tandoori Kitchen"
    And the center of the map should be approximately "57.6632027" lat and "11.9405717" lng
