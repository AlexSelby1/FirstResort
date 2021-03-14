require "application_system_test_case"

class JobApplicationsTest < ApplicationSystemTestCase
  setup do
    @job = jobs(:one)
  end

  test "visiting the index" do
    visit jobs_url
    assert_selector "h1", text: "Job Applications"
  end

  test "creating a Job application" do
    visit jobs_url
    click_on "New Job Application"

    fill_in "Category", with: @job.category
    fill_in "Country", with: @job.country
    fill_in "Description", with: @job.description
    fill_in "Title", with: @job.title
    fill_in "User", with: @job.user_id
    click_on "Create Job application"

    assert_text "Job application was successfully created"
    click_on "Back"
  end

  test "updating a Job application" do
    visit jobs_url
    click_on "Edit", match: :first

    fill_in "Category", with: @job.category
    fill_in "Country", with: @job.country
    fill_in "Description", with: @job.description
    fill_in "Title", with: @job.title
    fill_in "User", with: @job.user_id
    click_on "Update Job application"

    assert_text "Job application was successfully updated"
    click_on "Back"
  end

  test "destroying a Job application" do
    visit jobs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job application was successfully destroyed"
  end
end
