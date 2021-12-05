@update @APItest
Feature: UpdateGame

  Background:
    * def configuration = Java.type('utilities.ConfigurationReader')
    * def gameUrl = configuration.get("test_api_url")
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
