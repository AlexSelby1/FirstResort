class Review < ApplicationRecord

   # attr_accessor :reviewee_id

    belongs_to :reviewer, class_name: "User"
    belongs_to :user, class_name: "User"
  
  #  scope :reviews_for, ->(user) { where("for_user = ?", user) }
  #  scope :reviews_by,  ->(user) { where("by_user = ?", user) }

    validates :rating, presence: true
    validates :comment, presence: true, length: { maximum: 500 }

    def average_rating
      Review.where(:user_id => self.user_id).average(:rating).to_d
    end
end
