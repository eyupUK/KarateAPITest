@getall @APItest
Feature: Task 2

  Background:
    * def configuration = Java.type('utilities.ConfigurationReader')
    * def gameUrl = configuration.get("test_api_url")
    * def query = read ('classpath:data/getAllGames.graphql')


  Scenario: Getting all games
    Given url gameUrl
          And path '/graphql/games'
          * request { query: '#(query)' }
    When method post
    Then status 200
         And match header Content-Type == 'application/json; charset=utf-8'
         * match header Date == '#present'

