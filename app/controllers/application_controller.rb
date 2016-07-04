class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  def check_admin
    redirect_to root_path unless current_user.is_admin?
  end

  helper_method :current_order
  def current_order
    if session[:order_id].present?
      Order.find_by id: session[:order_id]
    else
      Order.new
    end
  end

  def signed_in_user
    unless signed_in?
      store_location
      flash[:danger] = t "user.authorization.message"
      redirect_to signin_url
     end
   end
end
