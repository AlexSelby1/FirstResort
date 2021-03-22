class AddHostToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :isHost, :boolean, default: false
  end
end
