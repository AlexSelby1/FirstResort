class RenameColumnJobApplicationsAccept < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_applications, :accept, :isAccepted
  end
end
