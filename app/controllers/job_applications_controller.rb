class JobApplicationsController < ApplicationController
 # before_action :set_user
#before_action :set_job
  before_action :authenticate_user!

  def create
    @job_application = current_user.job_applications.build(:job_id => params[:job_id])
#   @job_application = current_user.job_applications.build(:application_params)
  #  @job_application.applicant_id = current_user.id
  # @job_application.job_id = @job.id
    if @job_application.save
     if Conversation.between(params[:sender_id], params[:recipient_id]).present?
      @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
     else
      @conversation = Conversation.create!(conversation_params)
   end
    redirect_to conversation_messages_path(@conversation), notice: 'Application was successfully created'
    else
      redirect_to root_url, alert: 'Unable to apply.'
    end
  end

  def destroy
    @job_application = current_user.job_applications.find(params[:id])
    @job_application.destroy
    flash[:notice] = "Rejected Applicant."
    redirect_to current_user
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
  def set_job
    @job = JobApplication.find(params[:job_id])
  end
  def application_params
    params.require(:job_application).permit(:applicant_id, :job_id).merge(applicant_id: params[:applicant_id])
    end
end
