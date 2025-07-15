Feature: ACTUALIZAR USUARIOS

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

  Scenario: ACTUALIZAR USUARIO status code 200
    Given url 'https://serverest.dev/usuarios/5LhsyFUOrODPKcOu'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    And request { "nome": "Fulano da Silva","email": "cascas@qas.com.br","password": "teste", "administrador": "true"}
    When method PUT
    Then status 200

  Scenario: ACTUALIZAR USUARIO status code 400
    Given url 'https://serverest.dev/usuarios/1'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    And request { "nome": "Fulano da Silva","email": "beltrano@qa.com.br","password": "teste", "administrador": "true"}
    When method PUT
    Then status 400


