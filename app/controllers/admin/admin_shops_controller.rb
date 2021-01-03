class Admin::AdminShopsController < ApplicationController
  before_action :if_not_admin
  def index
    
  end

  def new
    @shop= Shop.new
  end

  def create
    @shop = Shop.create(shop_params)
    if @shop.valid?
      @shop.save
      redirect_to admin_admin_shops_path
    else
      render :new
    end
  end


private
  def if_not_admin
    unless current_user.admin?
    redirect_to root_path 
    end
  end

  def shop_params
    params.require(:shop).permit(:image, :shop_name, :genre_id, :profile, :p_num, :p_code, :prefecture_id, :city, :address, :building, tag_ids: []).merge(user_id: current_user.id)
  end

end