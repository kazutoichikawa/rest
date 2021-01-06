class ReviewsController < ApplicationController
  def create
    @reviews = Review.create(review_params)
    if @reviews.save
      redirect_to shop_path (params[:shop_id])
    else
      @shop = @review.shop
      @resviews = @shop.review.includes(:resview)
      @reservation = Review.new
      render 'shops/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
