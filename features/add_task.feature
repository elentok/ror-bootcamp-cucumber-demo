Feature: Add task
  As a user
  I want to add a task
  so I can have tasks

  @wip
  Scenario: user adds a task
    Given the task list page
    When I fill in "Task Title:" with "my task"
    And I click on "Add"
    Then I see "task added successfully"
    And the database has a task titled "my task"
    And the task list now has a task titled "my task"
    And the "Task Title:" field is blank

  Scenario: user can't add a task without a title
    Given the task list page
    When I click on "Add"
    Then I see "can't be blank"
