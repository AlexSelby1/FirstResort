class RemoveFnameFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :fname, :string
    remove_column :users, :lname, :string
  end
end
