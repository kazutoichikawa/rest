class ReservationsController < ApplicationController
  def create
    @reservation = Reservation.create(review_params)
  end

  private
  def review_params
    params.require(:reservation).permit(:date, :time, :n_people).merge(user_id: current_user.id, shop_id: params[:shop_id])
  end
end
