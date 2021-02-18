class AddCandidateToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isCandidate, :boolean, default: false
  end
end
