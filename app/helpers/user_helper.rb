module UserHelper
def user_is_admin
    current_user && current_user.admin
end
def user_is_host
    current_user && current_user.isHost
end
def user_is_candidate
    current_user && current_user.isCandidate
end

end