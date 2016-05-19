Feature: Walkthrough

  Scenario: A User Logs In
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Tavern"

  Scenario: A User Logs Out
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Sign Out"
    Then I should see "Sign in"

  @javascript
  Scenario: A User Has a Page Showing their Info
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Vivek"
    Then I should see "Games"

  @javascript
  Scenario: A User Has Pending Friends
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    Then I should see "Awaiting approval"

  @javascript
  Scenario: A User Goes To a Game Session
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Dane's Cool Game"
    Then I should see "Dane's Cool Game"

  @javascript
  Scenario: A Game Session Has a Sheet Template
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Dane's Cool Game"
    And I click "Template"
    Then I should see "Stats"

  @javascript
  Scenario: A Game Session Has an Armory
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Dane's Cool Game"
    And I click "Armory"
    Then I should see "Weapons"

  @javascript
  Scenario: A Game Session Can Make New Characters
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "Dane's Cool Game"
    And I click "Create character"
    Then I should see "Bio"

  Scenario: A User Visits the About Page
    Given I have an existing test environment
    When I go to the root path
    And I fill in "Email" with "test@test.test"
    And I fill in "Password" with "password"
    And I press "Sign in"
    And I click "About"
    Then I should see "Janina Hartley"
