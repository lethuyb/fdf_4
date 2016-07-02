class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def admin_user
    if signed_in?
      if current_user.is_admin?
        redirect_to root_path
      end
    end
  end

  helper_method :current_order
  def current_order
    if session[:order_id].present?
      Order.find_by id: session[:order_id]
    else
      Order.new
    end
  end
end
