@schemaValidation
Feature: JSON schema

Background:
  * def gameUrl = 'http://localhost:4000'
  * def query = read ('classpath:data/getGame.graphql')
  * def id = Java.type('utilities.GetGameIdQuery')
  * def variables = id.getId(1)

  Scenario: Json Schema validation
    Given url gameUrl
          And path '/graphql/games'
    And request { query: '#(query)' , variables: '#(variables)' }
    When method post
    Then status 200
          And match header Content-Type == 'application/json; charset=utf-8'
          * match header Date == '#present'
          * string jsonSchemaExpected = read ('classpath:data/GameSchema.json')
          * string jsonData = response
          * def SchemaUtils = Java.type('utilities.JSONSchemaUtil')
          * assert SchemaUtils.isValid(jsonData,jsonSchemaExpected)