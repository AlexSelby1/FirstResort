module UserHelper
def user_is_admin
    current_user && current_user.isAdmin
end
def user_is_host
    current_user && current_user.isHost
end
def user_is_candidate
    current_user && current_user.isCandidate
end
def user_is_owner
    current_user && current_user.id == @job_application.user_id
end   

end