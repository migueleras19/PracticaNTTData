Feature: Prueba de NttData para el puesto de QA Automation

  Background:
    * def baseUrl = 'https://petstore.swagger.io/v2'
  Scenario: Añadir una mascota a la tienda
    Given url baseUrl + '/pet'
    And request {id: 1, name: 'Thor', status: 'available'}
    When method POST
    Then status 200