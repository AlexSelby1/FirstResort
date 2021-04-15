class Review < ApplicationRecord

    # Associations
    belongs_to :reviewer, class_name: "User"
    belongs_to :user, class_name: "User"
  
    # Validations
    validates :rating, presence: true
    validates :comment, presence: true, length: { maximum: 500 }
    validates :user_id, uniqueness: { scope: :reviewer_id, alert: "You've already reviewed this user!" }


    # Method for average rating of all reviews for a user
    def average_rating
      Review.where(:user_id => self.user_id).average(:rating).to_d
    end
end
