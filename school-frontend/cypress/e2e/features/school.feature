Feature: Add new student

  Scenario: User adds a new student successfully
    Given I am on the homepage
    When I add a new student named "Test Öğrenci"
    Then I should see "Test Öğrenci" in the student list
