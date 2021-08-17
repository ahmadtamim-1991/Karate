Feature: Delete feature file.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'
And def Token = call read('GenerateToken.feature')

Scenario: this will Get or retriev our data from database
Given path 'auth/webapi/remove/505'
And headers {Authorization: '#("Bearer " + Token.token)'}
When method Delete
Then status 200
And print response 