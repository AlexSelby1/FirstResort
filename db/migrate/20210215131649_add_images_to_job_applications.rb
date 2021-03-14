class AddImagesToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :images, :json
  end
end
