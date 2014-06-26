class ReviewsController < ApplicationController

  def create
  	@review = current_user.reviews.build(review_params)
    @review.restaurant_id = params[:restaurant_id]
    @review.save
    redirect_to restaurant_path(@review.restaurant_id)
  end

  def destroy
  end

  private

  def review_params
  	params.require(:review).permit(:body, :user_id, :restaurant_id, :rating)
  end
end
