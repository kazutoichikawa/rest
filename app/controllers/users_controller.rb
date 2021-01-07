class UsersController < ApplicationController
  def show
    require "date"
    @user = User.find(params[:id])
    @reservations = Reservation.where("(user_id = ?) AND (reservations.date > ?)",  current_user.id, Date.today).order(:time)
  end
end