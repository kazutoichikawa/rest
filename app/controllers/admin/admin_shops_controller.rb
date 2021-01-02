class Admin::AdminShopsController < ApplicationController
  before_action :if_not_admin
  def index
    
  end

private
  def if_not_admin
    unless current_user.admin?
    redirect_to root_path 
    end
  end

end