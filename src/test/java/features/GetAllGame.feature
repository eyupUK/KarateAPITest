@getall
Feature: Task 2

  Background:
    * def gameUrl = 'http://localhost:4000'
    * def query = read ('classpath:data/getAllGames.graphql')


  Scenario: Getting all games
    Given url gameUrl
          And path '/graphql/games'
          * request { query: '#(query)' }
    When method post
    Then status 200
         And match header Content-Type == 'application/json; charset=utf-8'
         * match header Date == '#present'

