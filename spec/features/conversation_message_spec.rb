require 'rails_helper'

# Conversation and Message Testing - Sending message from Candidate and Host

feature "conversation message spec" do

    scenario "Send message to Host after applying", js: true do
        sign_up_host
        create_job
        sign_out
        sign_up_candidate
        apply_for_job

        find(:css, 'textarea').set("Hello Host. This is a test message") 
        click_button "Send Message"

        sign_out
    end

    scenario "Send message to Candidate", js: true do
        log_in_host

        find(:css, 'i.fa.fa-user.fa-2x.fa-inverse').click

        click_link "View Applicants"
        expect(current_path).to eq "/jobs/1/job_applications"

        click_link "Message"
        expect(current_path).to eq "/conversations/1/messages"

        find(:css, 'textarea').set("Hello Candidate. This is a also test message") 
        click_button "Send Message"

        sign_out
    end
end 