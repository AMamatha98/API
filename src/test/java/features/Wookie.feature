Feature: Converting JSON to Wookie Format

  Background: API end point URl
    * url 'https://swapi.dev/api/planets/14'

  Scenario: Verify Wookiee Formatted Conversion
    When method GET
    Then status 200
     * print response
    And param format = 'wookiee'
    When method GET
    Then status 200
    * print response