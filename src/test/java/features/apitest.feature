Feature: API Tasks
Background: API end point URl
  * url 'https://swapi.dev/api/'

  Scenario: get response
    When method GET
    Then status 200
    * print response
    Given path 'people/1'
    And request {'name' : 'mamatha'}
    When method PUT
    Then status 405
    And match response == { "detail": "Method 'PUT' not allowed." }
    And request {'day' : 'Monday'}

    When method POST
    Then status 405
    * print response
    And match response == { "detail": "Method 'POST' not allowed." }

    When method Delete
    Then status 405
    * print response
    And match response == { "detail": "Method 'DELETE' not allowed." }

  Scenario: get details for starship 9
    Given path 'starships/9'
    When method GET
    Then status 200
    * print response
    * def Expname = response.name
    * print Expname
    * match Expname == 'Death Star'
    * def Expcrew = response.crew
    * print Expcrew
    * match Expcrew == '342,953'

  Scenario: get details for People Call 3
    Given path 'people/3'
    When method GET
    Then status 200
    * print response
    * def ExpName = response.name
    * print ExpName
    * match ExpName == 'R2-D2'
    * def ExpSkinColor = response.skin_color
    * print ExpSkinColor
    * match ExpSkinColor == 'white, blue'
    * def ExpFilms1 = response.films
    Given path 'films/1'
    When method GET
    Then status 200
    * print response
    * def ExpFilm1 = response.title
    * print ExpFilm1
    Given path 'films/2'
    When method GET
    Then status 200
    * print response
    * def ExpFilm2 = response.title
    * print ExpFilm2
    Given path 'films/3'
    When method GET
    Then status 200
    * print response
    * def ExpFilm3 = response.title
    * print ExpFilm3
    Given path 'films/4'
    When method GET
    Then status 200
    * print response
    * def ExpFilm4 = response.title
    * print ExpFilm4
    Given path 'films/5'
    When method GET
    Then status 200
    * print response
    * def ExpFilm5 = response.title
    * print ExpFilm5
    Given path 'films/6'
    When method GET
    Then status 200
    * print response
    * def ExpFilm6 = response.title
    * print ExpFilm6
  * def ExpectedFilms = 'A New Hope, The Empire Strikes Back, Return of the Jedi, The Phantom Menace, Attack of the Clones, Revenge of the Sith'
  * def ActualFilms = ExpFilm1+','+' '+ExpFilm2+','+' '+ExpFilm3+','+' '+ExpFilm4+','+' '+ExpFilm5+','+' '+ExpFilm6
  * match  ExpectedFilms == ActualFilms

  Scenario: get details for Species 3
    Given path 'species/3'
    When method GET
    Then status 200
    * print response
    * def Expname = response.name
    * print Expname
    * match Expname == 'Wookie'
    * def ExpClassification = response.classification
    * print ExpClassification
    * match ExpClassification == 'mammal'
    Given path 'planets/14'
    When method GET
    Then status 200
    * print response
    * def ExpHomeWorld = response.name
    * print ExpHomeWorld
    * match ExpHomeWorld == 'Kashyyyk'

