Feature: see all tasks
  As a user
  I want to see my incomplete tasks so
  I can know what to do

  Scenario: user sees all tasks
    Given the following tasks:
      | title             |
      | do something      |
      | do something else |
    And the task list page
    Then I see the following tasks:
      | title             |
      | do something      |
      | do something else |

