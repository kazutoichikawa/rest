class ShopsController < ApplicationController
  before_action :set_shop, only:[:show]
  before_action :search_shop, only: [:index, :search]
  def index
    @shops = Shop.all.order("created_at DESC")
  end

  def show
    @review = Review.new
    @reviews = @shop.reviews.includes(:user)
  end

  def search
    @results = @p.result.includes(:category)  # 検索条件にマッチした商品の情報を取得
  end


  private
  def set_shop
    @shop = Shop.find(params[:id])
  end

  def search_shop
    @p = Product.ransack(params[:q])  # 検索オブジェクトを生成
  end


end