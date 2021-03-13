class UsersController < ApplicationController
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authorize_admin, only: :index

  def show
  @user = User.find(params[:id])
  @reviews = Review.where(user_id: @user.id).order("created_at DESC")
  end

  def index 
    @users = User.all 
    @reviews = @user.reviews
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:id, :email, :name, :password, :password_confirmation, :bio, :remember_me, :isHost, :isCandidate, :images, :file)
  end
  
  def authorize_admin
      redirect_to root_path, status: 401 unless current_user.admin
      #redirects to previous page
  end
end