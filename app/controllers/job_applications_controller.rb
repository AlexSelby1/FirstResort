class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_host, only: :index
  include JobApplicationHelper

   # GET /job_applications
  def index
    @job = Job.find(params[:job_id])
    @job_applications = @job.job_applications
    @pending_applications = @job.job_applications.where(isAccepted: false)
    @accepted_applications = @job.job_applications.where(isAccepted: true)
  end
 # POST /job_applications
  def create
    @job_application = current_user.job_applications.build(:job_id => params[:job_id])

    if @job_application.save
    redirect_to new_conversation_path(sender_id: params[:sender_id], recipient_id: params[:recipient_id]), :method => 'post', notice: 'Application was successfully created'
    else
      redirect_to root_url, alert: 'Unable to apply.'
    end
  end

  # DELETE /job_applications/1 
  def destroy
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to job_job_applications_path(@job), notice: "Rejected Applicant."
  end
  
# Method to accept job applications
  def toggle_accept
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @job_application.toggle(:isAccepted).save
    redirect_to job_job_applications_path(@job), notice: "Accepted Applicant."
  end


  private
  # Only allow a list of trusted parameters through.
  def application_params
    params.require(:job_application).permit(:applicant_id, :job_id).merge(applicant_id: params[:applicant_id])
  end
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
  # Redirection method to authorise a user
  def authorize_host
    redirect_to root_path, status: 401 unless current_user.isHost
    #redirects to previous page
  end
end
