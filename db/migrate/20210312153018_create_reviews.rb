class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :reviewer
      t.references :user
      t.timestamps
    end
  end
end
