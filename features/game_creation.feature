Feature: Create a Game

  @javascript
  Scenario: A User Creates a Game
  Given I have an existing test environment
  When I go to the root path
  And I fill in "Email" with "test@test.test"
  And I fill in "Password" with "password"
  And I press "Sign in"
  And I click "New Game"
  And I fill in "Name" with "The Peril of Xanderfall"
  And I fill in "Time" with "Monday 7pm"
  And I find "Create-Game"
  Then I should see "The Peril of Xanderfall"

  @javascript
  Scenario: A User Creates a Sheet Template
  Given I have an existing test environment
  When I go to the root path
  And I fill in "Email" with "test@test.test"
  And I fill in "Password" with "password"
  And I press "Sign in"
  And I click "New Game"
  And I fill in "Name" with "The Peril of Xanderfall"
  And I fill in "Time" with "Monday 7pm"
  And I find "Create-Game"
  Then I should see "The Peril of Xanderfall"
