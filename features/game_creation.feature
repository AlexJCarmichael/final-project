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
  And I find "#Create-Game"
  Then I should see "The Peril of Xanderfall"

  @javascript
  Scenario: A User Chooses a Sheet Template
  Given I have an existing test environment
  When I go to the root path
  And I fill in "Email" with "test@test.test"
  And I fill in "Password" with "password"
  And I press "Sign in"
  And I click "New Game"
  And I fill in "Name" with "The Peril of Xanderfall"
  And I fill in "Time" with "Monday 7pm"
  And I find "#Create-Game"
  And I find "#template-search"
  And I fill in "template-field" with "Dan"
  And I find ".clicky-this"
  Then I should see "Danes and Dragons"

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
  And I find "#Create-Game"
  And I find "#template-create"
  And I fill in "new-template-field" with "New Sheet"
  And I Press Enter in "#new-template-field"
  Then I should see "New Sheet"

  @javascript
  Scenario: A User Adds to a Sheet Template
  Given I have an existing test environment
  When I go to the root path
  And I fill in "Email" with "test@test.test"
  And I fill in "Password" with "password"
  And I press "Sign in"
  And I click "New Game"
  And I fill in "Name" with "The Peril of Xanderfall"
  And I fill in "Time" with "Monday 7pm"
  And I find "#Create-Game"
  And I find "#template-create"
  And I fill in "new-template-field" with "New Sheet"
  And I Press Enter in "#new-template-field"
  And I find "#stat"
  And I fill in "add-stat" with "Agility"
  And I Press Enter in "#add-stat"
  Then I should see "Agility"
