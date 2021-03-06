class RegistrationsController < Devise::RegistrationsController
    private 
   # Only allow a list of trusted parameters through.
    def sign_up_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :images, :isHost, :isCandidate)
    end
    
    def sign_in_params
     params.require(:user).permit(:email, :current_password, :images, :isHost, :isCandidate)
    end
    
    def account_update_params
     params.require(:user).permit(:name, :email, :password, :password_confirmation, :bio, :current_password, :images, :file, :isHost, :isCandidate, :country, :remove_images)
    end
   
   end