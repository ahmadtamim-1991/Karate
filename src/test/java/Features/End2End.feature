Feature: End2End feature file.

Background: 
Given url 'https://jobapplicationjwt.herokuapp.com/'
And def Token = call read('GenerateToken.feature')


Scenario: this scenario will create or add a new job description to the database
Given path 'auth/webapi/add'
And headers {Authorization: '#("Bearer " + Token.token)'}
When request read('requestBody/PostBody.json')
And method Post
Then status 201
And print response 
And def Id = response.jobId
And def jobT = response.jobTitle
And print Id


Given path 'auth/webapi/find'
And param id = Id
And param jobTitle = jobT
And headers {Authorization: '#("Bearer " + Token.token)'}
When method Get
Then status 200
And print response 

Given path 'auth/webapi/update'
And request
"""
{
  "experience": [
    "Very Experienced"
  ],
  "jobDescription": "program new softwareeeeee",
  "jobId": '#(Id)',
  "jobTitle": "programmer",
  "project": [
    {
      "projectName": "TekSchool",
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


Given path 'auth/webapi/remove/' + Id
And headers {Authorization: '#("Bearer " + Token.token)'}
When method Delete
Then status 200
And print response 

