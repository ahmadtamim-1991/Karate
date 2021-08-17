Feature: Generate token.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'

Scenario: This scenario will register our credentials to the server
Given path 'users/sign-up'
When request {"id": 0,"password": "ahmad","username": "mia"}
And method Post
Then status 200


Scenario: This scenario will create our Authorization token using our username and password
Given path 'users/authenticate'
When request {"password": "ahmad","username": "mia"}
And method Post
Then status 200
And print response.token
And def token = response.token
