@wip @APItest
Feature: AddGameDDT

  Background:
    * def configuration = Java.type('utilities.ConfigurationReader')
    * def gameUrl = configuration.get("test_api_url")
    * def query = read ('classpath:data/addGame.graphql')
    * def queryGet = read ('classpath:data/getAllGames.graphql')

#observed bug when suppliers id == 2

  Scenario Outline: Add game with given data

    Given url gameUrl
          And path '/graphql/games'
          * def variables = { "name":"<name>" , "slug":"<slug>" , "supplier":<supplier> }
          * request { query: '#(query)' , variables: '#(variables)' }
    When method post
    Then status 200
    # verify object created with given data
          And match response.data.addGame.name == variables.name
          * match response.data.addGame.slug == variables.slug
          * match response.data.addGame.supplier.id == variables.supplier

    # verify name of data should be unique per supplier
    Given url gameUrl
          And path '/graphql/games'
          * request { query: '#(queryGet)' }
    When method post
    Then status 200
    # getting all the objects which has supplier id equals with created object's supplier id
          And def response1 = response.data.games
          * def filt = function(x){ return x.supplier.id == '<supplier>' }
          * def items = get response1[*]
          * def res = karate.filter(items, filt)
    # getting all the object which has same name with created object's name
          * def filt2 = function(x){ return x.name == "<name>" }
          * def nameOnly = karate.filter(res,filt2)
    # in here expecting object's name to be unique according the docs
          * print nameOnly
          * match nameOnly == '#[1]'


    Examples:
      | read('data/dataSet.csv')|