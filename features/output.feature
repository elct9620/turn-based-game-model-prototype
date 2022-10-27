Feature: Output
  Background:
    Given there have a battle

  Scenario: Can see the battle output
    When an actor "蒼時" joined
    Then I can see "蒼時加入戰鬥"
