class ReservationsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:create, :index]

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
  
  def correct_user
    @reservation = Reservation.find(params[:shop_id])
      unless @reservation.user_id == current_user.id
        redirect_to root_url
      end
  end

end