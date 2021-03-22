module JobsHelper
# Checked to see if a logged in user has applied for a job
    def applied_to_this_job(job)
        JobApplication.where(applicant_id: current_user.id, job_id: job.id ).exists?
    end
# Checking to see if a Host has accepted the users application
    def accepted_to_this_job
        JobApplication.where(applicant_id: current_user.id, job_id: job.id, isAccepted: true).exists?
    end
    
end
