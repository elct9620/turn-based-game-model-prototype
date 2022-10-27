Feature: Attack
  Background:
    Given there have a battle
    And there are some actors
      | name   | hp  |
      | 蒼時   | 100 |
      | 哥布林 | 100 |

  Scenario: 蒼時 can attack 哥布林
    When "蒼時" attack "哥布林" with <amount> point
    Then I can see "哥布林受到 <amount> 點傷害"

    Examples:
      | amount |
      | 10     |
      | 20     |
