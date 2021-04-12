class ReviewsController < ApplicationController
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :set_user

    # GET user/1/reviews
    def show
    end

    # GET user/1/reviews/new
    def new
        @review = current_user.reviews.build
   
    end

    def create
        @review = current_user.reviews.build(review_params)
        @review.reviewer_id = current_user.id
        @review.user_id = @user.id
            if @review.save
                redirect_to root_path, notice: 'Review was successfully created'
            else 
            render 'new'
            end
    end

    # GET user/1/reviews/edit
    def edit
    end

    # PATCH/PUT user/1/reviews/1
    def update
        @review.update(review_params)
    end
    
   # DELETE user/1/reviews/1
    def destroy
        @review.destroy
    end

private
 # Only allow a list of trusted parameters through.
   def review_params
   params.require(:review).permit(:rating, :comment, :reviewer_id, :user_id).merge(user_id: params[:user_id])
   end

# Find user by id
   def set_user
    @user = User.find(params[:user_id])
  end
end
