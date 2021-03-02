class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :job_applications, :category, :cat
  end
end
