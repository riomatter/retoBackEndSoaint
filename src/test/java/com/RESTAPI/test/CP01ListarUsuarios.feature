Feature: LISTAR USUARIOS

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


  Scenario: GET USUARIOS status code 200
    Given url 'https://serverest.dev/usuarios'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    When method GET
    Then status 200

  Scenario: GET USUARIOS status code 405
    Given url 'https://serverest.dev/usuariosx'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    When method GET
    Then status 405