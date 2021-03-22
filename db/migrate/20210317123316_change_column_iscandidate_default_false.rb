class ChangeColumnIscandidateDefaultFalse < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :isCandidate, :boolean, :default => false
  end
end
