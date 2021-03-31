class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :set_user

    def index 
        @reviews = Review.all
    end
    
    def show
    end

    def new
        @review = current_user.reviews.build
   
    end

    def edit
    end

    def create
   #     @user = User.find(params[:reviewee_id])
        @review = current_user.reviews.build(review_params)
        @review.reviewer_id = current_user.id
        @review.user_id = @user.id
   #     @review = current_user.reviews.create!(reviewer_id: current_user.id, reviewee_id: @user.id, review: params(review_params))

        if @review.save
            redirect_to root_path, notice: 'Review was successfully created'
        else 
            render 'new'
        end
    end

    def update
        @review.update(review_params)
    end

    def destroy
        @review.destroy
    end

    private
    def set_review
       @review = Review.find(params[:id])
    end

   def review_params
   params.require(:review).permit(:rating, :comment, :reviewee_id, :user_id).merge(user_id: params[:user_id])
  # params.require(:review).permit(:rating, :comment)
   end

   def set_user
    @user = User.find(params[:user_id])
  end
end
