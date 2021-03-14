class CreateJobApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :country
      t.string :category
      t.date :duration
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
