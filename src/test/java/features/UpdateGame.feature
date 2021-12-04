@update
Feature: UpdateGame

  Background:
    * def gameUrl = 'http://localhost:4000'
    * def query = read ('classpath:data/updateGame.graphql')
    * def GG = Java.type('utilities.GameUpdater')
    ##defining updated data and the data id which will be updated
    * def variables = GG.updateGame(1,"UPDATE","UPDATE",1)


  Scenario: task2

    Given url gameUrl
          And path '/graphql/games'
          * request { query: '#(query)' , variables: '#(variables)' }
    When method post
    Then status 200
          And print variables
          * match response.data.updateGame.id == variables.id
          * match response.data.updateGame.name == variables.name
          * match response.data.updateGame.slug == variables.slug
          * match response.data.updateGame.supplier.id == variables.supplier
          * match header Content-Type == 'application/json; charset=utf-8'
          * match header Date == '#present'
