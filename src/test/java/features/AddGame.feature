@addgame
Feature: AddGame

  Background:
    * def gameUrl = 'http://localhost:4000'
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

