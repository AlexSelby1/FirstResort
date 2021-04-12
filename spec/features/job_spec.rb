require 'rails_helper'

# Job Testing - Adding and deleting

feature "job spec" do
    scenario "Create a Job", js: true do
        sign_up_host
        create_job
    end

    scenario "Delete a Job", js: true do
        log_in_host
        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click
        click_on('Barman required for a test')
        
        click_link "Delete"
        page.driver.browser.switch_to.alert.accept
        expect(current_path).to eq "/jobs/1"
        expect(page).to have_content "Job was successfully destroyed." 
    end
end
