Feature: Prueba de NttData para el puesto de QA Automation

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
  Scenario: Añadir una mascota a la tienda
    Given url baseUrl + '/pet'
    And request {id: 5, name: 'Kitty', status: 'available'}
    When method POST
    Then status 200

  Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID))
    Given url baseUrl + '/pet/1'
    When method GET
    Then status 200
    And match response == { id: 5, name: 'Kitty', status: 'available', category: '#ignore', photoUrls: '#ignore', tags: '#ignore' }

  Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
    Given url baseUrl + '/pet'
    And request {id: 5, name: 'Kitty update', status: 'sold'}
    When method PUT
    Then status 200

  Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
    Given url baseUrl + '/pet/findByStatus'
    And param status = 'sold'
    When method GET
    Then status 200
    And match response == [{id: 5, name: 'Kitty update', status: 'sold'}]