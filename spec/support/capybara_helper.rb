module CapybaraHelper
    def login(email, password)
        fill_in "Email", with: email
        fill_in "Password", with: password
        click_button "Log In"
    end
    def sign_up_host
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
    end
    def log_in_host        
        visit "/"
        click_link "Log In"
        expect(current_path).to eq(new_user_session_path)
  
        fill_in "Email", with: "alex.selby@test.com"
        fill_in "Password", with: "password"
    
        click_button "Log In"
        expect(current_path).to eq "/"
        expect(page).to have_content "Signed in successfully."
    end

    def sign_up_candidate
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
    end

    def sign_up_candidate2
        visit "/"
        click_link "Sign Up"
        expect(current_path).to eq(new_user_registration_path)
        choose(option: "false")
        fill_in "Name", with: "Candidate"
        fill_in "Email", with: "candidate@candidate.com"
        fill_in "Password", with: "password"
        fill_in "Password confirmation", with: "password"
    
        click_button "Sign Up"
        expect(current_path).to eq "/"
        expect(page).to have_content "Welcome! You have signed up successfully."
    end

    def log_in_candidate      
        visit "/"
        click_link "Log In"
        expect(current_path).to eq(new_user_session_path)
        fill_in "Email", with: "alex.selby@candidate.com"
        fill_in "Password", with: "password"
        click_button "Log In"
        expect(current_path).to eq "/"
        expect(page).to have_content "Signed in successfully."
    end
    
    def sign_out
        find(:css, 'i.fa.fa-sign-out.fa-2x.fa-inverse').click
        expect(current_path).to eq "/"
        expect(page).to have_content "Signed out successfully"
    end

    def fill_in_trix_editor(id, with:)
        find(:css, "##{id}").click.set(with)
    end

    def alert_present?
        begin
          page.driver.browser.switch_to.alert
          return true
        rescue
          return false
        end
    end

    def create_job
        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
        click_link "New Job"
        fill_in "Title", with: "Barman required for a test"
        select "Ireland", from: "Country", match: :first
        select "Bar", from: "Category"
        find(:css, 'trix-editor').set("This is a test job") 
        click_button "Create Job"
        expect(current_path).to eq "/jobs/1"
        expect(page).to have_content "Job was successfully created."
    end

    def apply_for_job
        find(:css, 'i.fa.fa-search.fa-2x.fa-inverse').click
        click_link "Apply"
        expect(current_path).to eq "/conversations/1/messages"
        expect(page).to have_content "Application was successfully created"
    end

    def accept_application
        click_button "Accept"
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq "/jobs/1/job_applications"
        expect(page).to have_content "Accepted Applicant."
    end

    def reject_application
        click_button "Reject"
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq "/jobs/1/job_applications"
        expect(page).to have_content "Rejected Applicant."
    end
end