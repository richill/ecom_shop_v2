class ApplicationController < ActionController::Base
  include Pagy::Backend
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_cart
    cart = Cart.find_or_create_by(token: cookies[:cart_token])
    cookies[:cart_token] ||= cart.token
    cart
  end
  helper_method :current_cart

  def after_sign_in_path_for(resources)
    if current_user
      products_path
      # dashboard_user_path(current_user)
    elsif current_admin
      dashboard_admin_path(current_admin)
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:email) }
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password) }
  end
end
