Feature: Discovery
  In order to provide control of the coffee ordering system, staff members should be presented with a list of mechanisms for performing actions.

  Scenario: Coffee ordering system
    Given a Coffee ordering system at "http://localhost:8123"
    When a customer accesses the coffee ordering system
    Then they are provided with a mechanism for placing orders
    And they are provided with a mechanism for querying orders
