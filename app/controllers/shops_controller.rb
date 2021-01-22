class ShopsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_shop, only:[:show]
  before_action :search_shop, only: [:index]
  before_action :reservation_check, only: [:index, :show]
  def index
    @p = Shop.ransack(params[:q])
    @results = @p.result(distinct: true).order("RAND()")
  end

  def show
    @reservation = Reservation.new
    @review = Review.new
    @reviews = @shop.reviews.includes(:user)
  end

  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def search_shop
    @genres = Genre.all
    @prefectures = Prefecture.all
    @tags = Tag.all
  end

  def reservation_check
    if user_signed_in?
      @reservations = Reservation.where("(user_id = ?) AND (reservations.date > ?)",  current_user.id, Date.today).order(:date).order(:time)
    end
  end
end