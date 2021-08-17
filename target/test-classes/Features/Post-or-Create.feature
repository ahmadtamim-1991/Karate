Feature: Generate token.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'
And def Token = call read('GenerateToken.feature')
#And def myToken = Token.token
#And print myToken

Scenario: this scenario will create or add a new job description to the database
Given path 'auth/webapi/add'
And headers {Authorization: '#("Bearer " + Token.token)'}
When request {"experience": ["not much"],"jobDescription": "program new software","jobId": 505,"jobTitle": "programmer","project": [{"projectName": "Software","technology": ["IT"]}]}
And method Post
Then status 201
And match response.jobTitle == 'programmer'
And match response.experience[0] == 'not much'
And match response.project[0].technology[0] == 'IT' 
And print response 