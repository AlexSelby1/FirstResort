module UserHelper
# Checking to see if the user is logged in and is an Admin
    def user_is_admin
        current_user && current_user.isAdmin
    end
# Checking to see if the user is logged in and is a Host
    def user_is_host
      current_user && current_user.isHost
    end
# Checking to see if the user is logged in and is a Candidate
    def user_is_candidate
        current_user && current_user.isCandidate
    end
# Checking to see if the user is logged in and an owner of a posted job
    def user_is_owner(job)
        current_user && current_user.id == job.user_id
    end   
    # Checking to see if it is the users profile
    def user_profile
        params[:id].to_i == current_user.id   
    end 
end