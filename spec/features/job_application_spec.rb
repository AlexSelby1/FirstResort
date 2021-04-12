require 'rails_helper'

# Job Application Testing - Applying, Accepting, Rejecting

feature "job application spec" do
    scenario "Apply for a job", js: true do
        sign_up_host
        create_job
        sign_out
        sign_up_candidate
        apply_for_job
        sign_out
    end
    
    scenario "Accept an application", js: true do
        log_in_host 

        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
        click_link "View Applicants"
        expect(current_path).to eq "/jobs/1/job_applications"

        accept_application
        sign_out
    end

    scenario "Reject an application", js: true do
        sign_up_candidate2

        find(:css, 'i.fa.fa-search.fa-2x.fa-inverse').click
        click_link "Apply"
        expect(current_path).to eq "/conversations/2/messages"
        expect(page).to have_content "Application was successfully created"

        sign_out 
        log_in_host

        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
        click_link "View Applicants"
        expect(current_path).to eq "/jobs/1/job_applications"

        reject_application
    end
end