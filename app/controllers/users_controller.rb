class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @u_reservations = User.where(user_id: current_user.id)
  end
end
