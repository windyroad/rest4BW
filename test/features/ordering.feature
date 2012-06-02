Feature: Ordering
  In order to complete coffee orders, staff members should be able to perform state transitions.

  Scenario Outline: Valid Order Actions
    Given an order in state "<start state>"
    When a staff member performs "<transition action>" on the order
    Then the order is in state "<end state>"

    Examples:
        | start state | transition action | end state |
        | created | start making | making |
        | making | finish making | ready |
        | ready | pickup | pickedup |
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
        | making | start making | can't start making an order that is making |
        | making | pickup | can't pickup an order that is making |
        | making | cancel | can't cancel an order that is making |
        | ready | start making | can't start making an order that is ready |
        | ready | finish making | can't finish making an order that is ready |
        | ready | cancel | can't cancel an order that is ready |
        | pickedup | start making | can't start making an order that is pickedup |
        | pickedup | finish making | can't finish making an order that is pickedup |
        | pickedup | pickup | can't pickup an order that is pickedup |
        | pickedup | cancel | can't cancel an order that is pickedup |
        | cancelled | start making | can't start making an order that is cancelled |
        | cancelled | finish making | can't finish making an order that is cancelled |
        | cancelled | pickup | can't pickup an order that is cancelled |
        | cancelled | cancel | can't cancel an order that is cancelled |



