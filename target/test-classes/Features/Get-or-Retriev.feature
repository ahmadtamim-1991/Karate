Feature: Get feature file.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'
And def Token = call read('GenerateToken.feature')

Scenario: this will Get or retriev our data from database
Given path 'auth/webapi/find'
And param id = 505
And param jobTitle = 'programmer'
And headers {Authorization: '#("Bearer " + Token.token)'}
When method Get
Then status 200
And print response 