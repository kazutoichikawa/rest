class ReservationsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def create
    if user_signed_in?
      @reservations = Reservation.where("(user_id = ?) AND (reservations.date > ?)",  current_user.id, Date.today).order(:date).order(:time)
    end
    @reservation = Reservation.create(reservation_params)
    unless @reservation.save
      @shop = @reservation.shop
      @reservations = @shop.reservations.includes(:reservations)
      @review = Review.new
      @reviews = @shop.reviews.includes(:shop)
      render 'shops/show'
    else
      session[:_csrf_token] = nil
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :n_people).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
