class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :job_applications do |t|
      t.references :job
      t.references :applicant
      t.boolean :accept, default: false

      t.timestamps
    end
  end
end
