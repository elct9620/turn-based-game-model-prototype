Feature: Escape
  Background:
    Given there have a battle
    And there are some actors
      | name   | hp  |
      | 蒼時   | 100 |
      | 哥布林 | 100 |

  Scenario: 蒼時 can escape
    When "蒼時" escaped
    Then I can see "蒼時 順利逃跑了！"
