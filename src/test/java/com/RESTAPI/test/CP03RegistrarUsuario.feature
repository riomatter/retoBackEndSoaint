Feature: REGISTRAR USUARIOS

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

  Scenario: REGISTRAR USUARIO status code 201
    * def randomEmail = 'user' + java.util.UUID.randomUUID().toString().substring(0,8) + '@gmail.com'
    Given url 'https://serverest.dev/usuarios'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    And request { "nome": "Fulano da Silva","email": "#(randomEmail)","password": "teste", "administrador": "true"}
    When method POST
    Then status 201

  Scenario: REGISTRAR USUARIO status code 400
    Given url 'https://serverest.dev/usuarios'
    And headers {Content-Type: 'application/json' , accept: application/json , Authorization: '#(authToken)' }
    And request { "nome": "Fulano da Silva","email": "beltrano@qa.com.br","password": "teste", "administrador": "true"}
    When method POST
    Then status 400


