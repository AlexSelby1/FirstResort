module JobApplicationHelper
 # Checked to see if an application is accepted
    def job_application_is_accepted(job_application)
        job_application.isAccepted == true
    end
# Checked to see if an application is pending
    def pending_application(job_application)
        job_application.isAccepted == false
    end
      # Checking to see if the reviewer has already reviewed the user
    def create_review_path(review, current_user)
        return '' if current_user.blank?
      
        if current_user.reviews.present?  
        else
            link_to "Write Review", new_user_review_path(job_application.job.user), :class => "button", :role => "button"
        end 
    end
end