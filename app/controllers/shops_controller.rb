class ShopsController < ApplicationController
  before_action :set_shop, only:[:show]
  def index
    @shops = Shop.all.order("created_at DESC")
  end

  def show
    @review = Review.new
    @reviews = @shop.reviews.includes(:user)
  end

end

private
def set_shop
  @shop = Shop.find(params[:id])
end
