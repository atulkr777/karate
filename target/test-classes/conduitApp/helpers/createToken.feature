Feature: create token
@ignore
Scenario: token creation

    Given url apiURL
    Given path 'users/login'
    And request {"user": {"email": "#(userEmail)","password": "#(userPassword)"}}
    When method post
    Then status 200
    * def authToken = response.user.token