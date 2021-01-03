class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :l_name, :f_name, :l_name_r, :f_name_r, :birthday, :p_num, :owner])
  end
end
