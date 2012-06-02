Feature: Ordering
  In order to complete coffee orders, staff members should be able to perform state transitions.


  Scenario Outline: Valid Order Actions
    Given an order in state "<start state>"
    When a staff member performs "<transition action>" on the order
    Then the order is in state "<end state>"

    Examples:
        | start state | transition action | end state |
        | created | start making | being made |
        | being made | finish making | ready |
        | ready | pickup | picked up |
        | created | cancel | cancelled |


  Scenario Outline: Invalid Order Actions
    Given an order in state "<start state>"
    When a staff member performs "<transition action>" on the order
    Then the error "<error>" is returned
    And the order is in state "<start state>"

    Examples:
        | start state | transition action | error |
        | created | finish making | can't finish making an order that is created |
        | created | pickup | can't pickup an order that is created |
        | being made | start making | can't start making an order that i being made |
        | being made | pickup | can't pickup an order that is being made |
        | being made | cancel | can't cancel an order that is being made |
        | ready | start making | can't start making an order that is ready |
        | ready | finish making | can't finish making an order that is ready |
        | ready | cancel | can't cancel an order that is ready |
        | picked up | start making | can't start making an order that is picked up |
        | picked up | finish making | can't finish making an order that is picked up |
        | picked up | pickup | can't pickup an order that has already been picked up |
        | picked up | cancel | can't cancel an order that is picked up |
        | cancelled | start making | can't start making an order that is cancelled |
        | cancelled | finish making | can't finish making an order that is cancelled |
        | cancelled | pickup | can't pickup an order that is cancelled |
        | cancelled | cancel | can't cancel an order that has already been cancelled |


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


