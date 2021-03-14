class RenameJobApplicationsToJob < ActiveRecord::Migration[6.0]
  def change
    rename_table :jobs, :jobs
  end
end
