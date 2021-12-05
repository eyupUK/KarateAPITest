@addgame @APItest
Feature: AddGame

  Background:
    * def configuration = Java.type('utilities.ConfigurationReader')
    * def gameUrl = configuration.get("test_api_url")
    * def query = read ('classpath:data/addGame.graphql')
    * def GG = Java.type('utilities.GameGenerator')
    * def variables = GG.createGame()


# adding game with randomly created data by GameGenerator class
#observed bug when suppliers id == 2

  Scenario: Add new game

    Given url gameUrl
          And path '/graphql/games'
          * request { query: '#(query)' , variables: '#(variables)' }
    When method post
    Then status 200
          * match response.data.addGame.supplier.id == variables.supplier

