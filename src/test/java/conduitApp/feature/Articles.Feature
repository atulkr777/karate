
Feature: Articles

Background: Defining Base URL

Given url apiURL



Scenario: creating a new article
    Given path 'articles'
    And request {"article": {"tagList": [],"title": "title","description": "details","body": "test test test"}}
    When method post
    Then status 200
    And match response.article.body == "test test test"

Scenario: Deleting an article
    Given path 'articles'
    And request {"article": {"tagList": [],"title": "deleteTitle","description": "details","body": "test test test"}}
    When method post
    Then status 200
    And match response.article.body == "test test test"
    * def articleid = response.article.slug

    Given path 'articles',articleid
    When method delete
    Then status 200
        
    Given path 'articles',articleid
    When method get
    Then status 404

