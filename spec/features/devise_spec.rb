require 'rails_helper'

#Devise Testing - sign in, sign up and sign out

feature "devise spec" do

  scenario "Register user as Host", js: true do
    sign_up_host
    sign_out
  end

  scenario "Register user as Candidate", js: true do
    sign_up_candidate
    sign_out
  end

  scenario "Sign in with correct details", js: true do
    FactoryBot.create(:user)
    visit "/"
    click_link "Log In"
    expect(current_path).to eq(new_user_session_path)

    login("alex.selby@candidate.com",	"password")

    expect(current_path).to eq "/"
    expect(page).to have_content "Signed in successfully"

    sign_out
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




