Given("I visit the home page") do
  visit root_path
end

When("I fill in the sign up form") do
  click_link "Sign up"
  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "pa$$word"
  fill_in "user_password_confirmation", with: "pa$$word"
  click_button "Sign up"
end

When("I confirm the email") do
  open_email("test@test.com")
  visit_in_email("Confirm my account")
end

Then("should see that my account is confirmed") do
  message = "Your email address has been successfully confirmed"

  expect(page).to have_content(message)
end

Given("I am a registered user") do
  @registered_user = FactoryBot.create(
    :user,
    :email => "test@test.com",
    :password => "pa$$word"
  )
end

When("I fill in the login form") do
  fill_in "user_email", :with => "test@test.com"
  fill_in "user_password", :with => "pa$$word"
  click_button "Log in"
end

Then("I should be logged in") do
  expect(page).to have_content("Logged in")
end

Given("I am logged in") do
  visit root_path

  fill_in "user_email", with: "test@test.com"
  fill_in "user_password", with: "pa$$word"

  click_button "Log in"
end

Given("I visit the homepage") do
  visit root_path
end

When("I click on the log out button") do
  click_button "Log out"
end

Then("I should be redirected to the log in page") do
  expect(page).to have_content("Log in")
end