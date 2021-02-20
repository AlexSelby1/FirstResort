class RemoveDurationFromJobApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_applications, :duration
  end
end
