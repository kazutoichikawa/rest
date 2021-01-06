class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_shop, only:[:show]
  before_action :search_shop, only: [:index, :search]
  def index
    @p = Shop.ransack(params[:q])
    @shops = Shop.all.order("created_at DESC")
  end

  def show
    @reservation = Reservation.new
    @review = Review.new
    @reviews = @shop.reviews.includes(:user)
  end

  def search
    @p = Shop.ransack(params[:q])
    @p = Shop.search(search_params)
    @results = @p.result(distinct: true)
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def search_params
    params.require(:q).permit(:genre_id_eq, :prefecture_id_eq, shop_tag_relations_tag_id_in:[])
  end

  def search_shop
    @shops = Shop.all.order("created_at DESC")
    @genres = Genre.all
    @prefectures = Prefecture.all
    @tags = Tag.all
  end
end