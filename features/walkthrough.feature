Feature: Walkthrough

  Scenario: A User Logs In
    Given I have an existing user account
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Dashboard for"
