require 'rails_helper'

feature "devise spec" do
  # `js: true` spec metadata means this will run using the `:selenium`
  # browser driver configured in spec/support/capybara.rb
  scenario "Register user as Host", js: true do
     
    visit "/"
    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    choose(option: "true")
    fill_in "Name", with: "Alex"
    fill_in "Email", with: "alex.selby@test.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"
    expect(current_path).to eq "/"
    expect(page).to have_content "Welcome! You have signed up successfully."

    click_link "Sign Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"
  end

  scenario "Register user as Candidate", js: true do
    visit "/"
    click_link "Sign Up"
   expect(current_path).to eq(new_user_registration_path)

    choose(option: "false")
    fill_in "Name", with: "Alex"
    fill_in "Email", with: "alex.selby@candidate.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign Up"
    expect(current_path).to eq "/"
    expect(page).to have_content "Welcome! You have signed up successfully."

    click_link "Sign Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"
  end

  #scenario "Failed register user with duplicate email",  js: true do
  #  visit "/"
  #  click_link "Sign Up"
  #  expect(current_path).to eq(new_user_registration_path)

#    FactoryBot.create(:user)
 #   choose(option: "true")
##    fill_in "Name", with: "John"
##    fill_in "Email", with: "john@gmail.com"
 #   fill_in "Password", with: "password"
 #   fill_in "Password confirmation", with: "password"
 #   click_button "Sign Up"
 #   expect(current_path).to eq "/users/sign_up"
  #  expect(page).to have_content "Invalid email"

#    click_link "Sign Out"

 #   expect(current_path).to eq "/"
 #   expect(page).to have_content "Signed out successfully"
#  end
  #scenario "Failed register user with invalid password", js: true do
 #   fill_in "Name", with: "Alex"
 #   fill_in "Email", with: "alex@gmail.com"
 #   fill_in "Password", with: "1234"
 #   fill_in "Password confirmation", with: "1234"
 #   click_button "Sign Up"

 #   expect(current_path).to eq "/users/sign_up"
 ##   expect(page).to have_content "Password does not meet criteria"
 # end

  scenario "Sign in with correct details", js: true do
    FactoryBot.create(:user)
    visit "/"

    click_link "Log In"
    expect(current_path).to eq(new_user_session_path)

    login("alex.selby@candidate.com",	"password")

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"

    click_link "Sign Out"

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed out successfully"

  end

  scenario "Sign in with incorrect details", js: true do

    visit "/"

    click_link "Log In"
    expect(current_path).to eq(new_user_session_path)

    login("john@gmail.com",	"incorrectpassword")

    expect(current_path).to eq "/users/sign_in"
    expect(page).to have_content "Invalid Email or password"
  end

  end

  private

  def login(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log In"
  end



