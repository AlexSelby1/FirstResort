class UsersController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authorize_admin, only: :index
    include UserHelper

  def show
    @user = User.find(params[:id])
    @reviews = Review.where(user_id: @user.id).page(params[:page]).per(3)
    @job_applications = JobApplication.where(applicant_id: @user.id, isAccepted: true)
    @jobs = Job.where(user_id: @user.id).page(params[:page]).per(3)

  if @reviews.blank?
    @avg_rating = 0
  else
    @avg_rating = @reviews.average(:rating).round(2)
  end
  end

  def index 
    @users = User.all 
  end

  def showCandidate
    @users = User.where(isCandidate: true, isAdmin: false)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id, :email, :name, :password, :password_confirmation, :bio, :remember_me, :isHost, :isCandidate, :images, :file)
  end
  
  def authorize_admin
      redirect_to root_path, status: 401 unless current_user.isAdmin
      #redirects to previous page
  end
  def authorize_host
    redirect_to root_path, status: 401 unless current_user.isHost
    #redirects to previous page
  end
end