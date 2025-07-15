Feature: LISTAR USUARIOS POR ID

  Background:
    * def config = karate.callSingle('classpath:karate-config.js')
    * karate.set('email', config.email)
    * karate.set('password', config.password)
    Given url 'https://serverest.dev/login'
    And headers {Content-Type: 'application/json' , accept: 'application/json'}
    And request { "email": '#(email)', "password": '#(password)' }
    When method POST
    Then status 200
    And match response.authorization != null
    And match response.authorization != ''
    * eval karate.set('authToken', 'Bearer ' + response.token)
    * eval karate.set('refresh_Token', response.refresh_token)


  Scenario: GET USUARIOS POR ID status code 200
    Given url 'https://serverest.dev/usuarios/00iz5o3PbB8CkAd5'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    When method GET
    Then status 200

  Scenario: GET USUARIOS POR ID status code 400
    Given url 'https://serverest.dev/usuarios/9'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    When method GET
    Then status 400
