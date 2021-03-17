class JobApplicationsController < ApplicationController
 # before_action :set_user
#before_action :set_job
  before_action :authenticate_user!

  def index
    @job = Job.find(params[:job_id])
   # @user = User.all
    @job_application = JobApplication.where(job_id: @job.id)
  #  @applicants = JobApplication.where(:applicant_id => user.id)
  end

  def create
    @job_application = current_user.job_applications.build(:job_id => params[:job_id])
#   @job_application = current_user.job_applications.build(:application_params)
  #  @job_application.applicant_id = current_user.id
  # @job_application.job_id = @job.id
    if @job_application.save
    redirect_to new_conversation_path(sender_id: params[:sender_id], recipient_id: params[:recipient_id]), :method => 'post', notice: 'Application was successfully created'
    else
      redirect_to root_url, alert: 'Unable to apply.'
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @job_application.destroy
    redirect_to job_job_applications_path(@job), notice: "Rejected Applicant."
  end

  def toggle_accept
    @job = Job.find(params[:job_id])
    @job_application = JobApplication.find(params[:id])
    @job_application.toggle(:isAccepted).save
    redirect_to job_job_applications_path(@job), notice: "Accepted Applicant."
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def set_job
    @job = Job.find(params[:job_id])
  end

  def application_params
    params.require(:job_application).permit(:applicant_id, :job_id).merge(applicant_id: params[:applicant_id])
  end
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end
