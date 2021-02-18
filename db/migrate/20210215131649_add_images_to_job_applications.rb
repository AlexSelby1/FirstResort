class AddImagesToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :images, :json
  end
end
