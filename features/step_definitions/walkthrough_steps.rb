Given(/^I have an existing user account$/) do
  User.create( user_name: "Jaxom555",
              name: "Dane",
              email: "test@test.test",
              password: "password" )
end

When(/^I go to the root path$/) do
  visit root_path
end

When(/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, content|
  fill_in(field, with: content)
end

When(/^I press "([^"]*)"$/) do |name|
  click_button(name)
end

Then(/^I should see "([^"]*)"$/) do |header|
  assert page.has_content?(header)
end
