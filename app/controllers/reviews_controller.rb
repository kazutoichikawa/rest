class ReviewsController < ApplicationController
  def create
    @reviews = Review.create(review_params)
    if @reviews.save
      redirect_to shop_path (params[:shop_id])
    else
      @shop = Shop.find(params[:shop_id])
      @reviews = @shop.reviews.includes(:user)
      @review = Review.new
      @reservation = Reservation.new
      render 'shops/show'
    end
  end

  private
  def review_params
    params.require(:review).permit(:text).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
