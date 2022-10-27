Feature: Attack
  Background:
    Given there have a battle
    And there are some actors
      | name   |
      | 蒼時   |
      | 哥布林 |

  Scenario: 蒼時 can attack 哥布林
    When "蒼時" attack "哥布林"
    Then I can see "哥布林受到 10 點傷害"
