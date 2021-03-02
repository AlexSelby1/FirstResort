require 'test_helper'

class JobApplicationsControllerTest < ActionDispatch::IntegrationTest

  setup do
    get '/users/sign_in'
    sign_in users(:one)
    post user_session_url
  end

  test "should get index" do
    get job_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_job_application_url
    assert_response :success
  end

  test "should create job_application" do
    assert_difference('JobApplication.count') do
      post job_applications_url, params: { job_application: { cat: @job_application.cat, country: @job_application.country, description: @job_application.description, title: @job_application.title, user_id: @job_application.user_id } }
    end

    assert_redirected_to job_application_url(JobApplication.last)
  end

  test "should show job_application" do
    get job_application_url(@job_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_application_url(@job_application)
    assert_response :redirected
  end

  test "should update job_application" do
    patch job_application_url(@job_application), params: { job_application: { cat: @job_application.cat, country: @job_application.country, description: @job_application.description, title: @job_application.title, user_id: @job_application.user_id } }
    assert_redirected_to job_application_url(@job_application)
  end

  test "should destroy job_application" do
    assert_difference('JobApplication.count', -1) do
      delete job_application_url(@job_application)
    end

    assert_redirected_to job_applications_url
  end
end
