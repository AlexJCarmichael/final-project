Feature: Walkthrough

  Scenario: A User Logs In
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Dashboard for"

  Scenario: A User Logs Out
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Sign out"
    Then I should see "Sign in"

    @javascript
    Scenario: A User Goes To a Game session
      Given I have an existing test environment
      When I go to the root path
      And I fill in "Email" with "test@test.test"
      And I fill in "Password" with "password"
      And I press "Sign in"
      And I click "Jaxom Vanee"
      Then I should see "Edit this character"

    @javascript
    Scenario: A User Goes To a Game session
      Given I have an existing test environment
      When I go to the root path
      And I fill in "Email" with "test@test.test"
      And I fill in "Password" with "password"
      And I press "Sign in"
      And I click "Dane's Cool Game"
      Then I should see "Dane's Cool Game"
