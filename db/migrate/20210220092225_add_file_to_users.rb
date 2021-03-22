class AddFileToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :file, :string
  end
end
