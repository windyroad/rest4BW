Feature: Discover the coffee shop's options
  As a staff member
  I want a list of actions available for the coffee shop
  So that I can choose which action to perform

Feature: Discover an order's options
  As a staff member
  I want a list of actions for an order
  So that I can choose which action to perform

Feature: View an order
  As a staff member
  I want to view the details of a coffee order
  So that I know which coffee to make

Feature: Create an order
  As a staff member
  I want to create coffee orders
  So that I can keep track of them

  Scenario: Creating a new valid order is successful
  Scenario: Creating an invalid order causes an error


Feature: Update an order
  As a staff member
  I want to update existing orders
  Because customers change their mind

  Scenario: Update an order with valid data is successful
  Scenario: Update an order with invalid data causes an error


Feature: Action an order
  As a staff member
  I want an easy way to action an order
  So that I can progress the state of an order

  Scenario Outline: Valid actions progress the state of the order
    Given an order in state "<start state>"
    When a staff member performs "<transition action>" on the order
    Then the order is in state "<end state>"

    Examples:


  Scenario Outline: Invalid actions cause an error
    Given an order in state "<start state>"
    When a staff member performs "<transition action>" on the order
    Then a response with status "<http status>" and text-content "<http text-content>" is returned
    And the order is in state "<start state>"

    Examples:


  Scenario Outline: Queries do not modify state
    Given an order in state "<start state>"
    When a staff member performs a query with firstname "<firstname>"
    Then the order is in state "<start state>"

    Examples:
        | start state | firstname |
        | created | john |
        | being made | john |
        | ready | john |
        | picked up | john |
        | cancelled | john |


  Scenario: Options do not modify state

Feature: Querying orders
  As a staff member
  I want to be able to search for orders by firstname
  So that I can respond to customer inquiries

  As a staff member
  I want to be able to search for the oldest coffee order, in the "created" state
  So that I know which coffee to make next



