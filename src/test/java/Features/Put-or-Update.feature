Feature: Generate token.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'
And def Token = call read('GenerateToken.feature')
#And def myToken = Token.token
#And print myToken

Scenario: this scenario will Put or Update a job description to the database
Given path 'auth/webapi/update'
And request 
"""
{
  "experience": [
    "not much"
  ],
  "jobDescription": "jobDescription=program new softwareeeeee",
  "jobId": 505,
  "jobTitle": "barber",
  "project": [
    {
      "projectName": "string",
      "technology": [
        "IT"
      ]
    }
  ]
}
"""
And headers {Accept: 'application/json', Content-Type: 'application/json', Authorization: '#("Bearer " + Token.token)'}
When method Put
Then status 200
And print response