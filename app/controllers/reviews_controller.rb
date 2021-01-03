class ReviewsController < ApplicationController
  def create
    @reviews = Review.create(review_params)
    redirect_to shop_path (params[:shop_id])
  end

  private
  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
