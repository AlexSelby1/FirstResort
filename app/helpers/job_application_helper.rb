module JobApplicationHelper
 # Checked to see if an application is accepted
    def job_application_is_accepted(job_application)
        job_application.isAccepted == true
    end
# Checked to see if an application is pending
    def pending_application(job_application)
        job_application.isAccepted == false
    end
end