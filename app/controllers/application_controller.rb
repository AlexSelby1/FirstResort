class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    include UserHelper, JobApplicationHelper, JobsHelper
  
    #Sanitizing user data to checking cleaning and filtering inputs from the user.
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :password, :images])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation, :isHost, :isCandidate, :images]) 
        devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :password, :password_confirmation, :current_password, :isHost, :isCandidate, :images])
    end
end
