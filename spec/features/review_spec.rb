require 'rails_helper'

# Review Testing - Applying, Accepting, Rejecting

feature "review spec" ,:focus do
    scenario "Host to create review", js: true do
        sign_up_host
        create_job
        sign_out
        sign_up_candidate
        apply_for_job
        sign_out
        log_in_host

        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
        click_link "View Applicants"
        expect(current_path).to eq "/jobs/1/job_applications"

        accept_application

        click_link "Write Review"
        
        expect(current_path).to eq "/users/2/reviews/new"

        find(:css, 'textarea').set("What a great employee for a test") 
 #  find("#star-rating", visible: false, match: :first).hover.click
 find('#star-rating').click('5') 
      #  find("#star-rating", visible: false).click
        click_button "Create Review"
        expect(current_path).to eq "/"
        expect(page).to have_content "Review was successfully created"

        sign_out
    end
    scenario "Candidate to create review", js: true do
      log_in_candidate 
      find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
      click_link "Write Review"

      expect(current_path).to eq "/users/1/reviews/new"
      fill_in "star-rating", with: "5"
      find(:css, 'textarea').set("What a great Host for a test") 
     # find("#star-rating").hover
      #find("#star-rating", visible: false).click
      click_button "Create Review"
      expect(current_path).to eq "/"
      expect(page).to have_content "Review was successfully created"
    end
end