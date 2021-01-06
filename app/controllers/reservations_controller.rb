class ReservationsController < ApplicationController
  before_action :login_required
  def index
  end

  def create
    @reservation = Reservation.create(reservation_params)
    unless @reservation.save
      @shop = @reservation.shop
      @reservations = @shop.reservations.includes(:reservations)
      @review = Review.new
      @reviews = @shop.reviews.includes(:shop)
      render 'shops/show'
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:date, :time, :n_people).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
  
  def login_required
    if user_signed_in?
      redirect_to root_path
    end
  end
end
