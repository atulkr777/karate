
Feature: Testing the homePage functionality

Background: Define Base URL

Given url apiURL

@debug
Scenario: Get all tags 
Given path 'tags'
When method Get
Then status 200
And match response.tags contains ['HITLER','Gandhi']
And match response.tags !contains 'truck'
And match response.tags == '#array'
And match each response.tags == '#string'

@debug
Scenario: Get 10 articles from the webpage
Given params {limit:10, offset:0}
Given path 'articles'
When method Get
Then status 200
And match response.articles == '#[10]'
And match response.articlesCount == 500

