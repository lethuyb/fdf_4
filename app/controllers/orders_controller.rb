class OrdersController < ApplicationController
  before_action :signed_in_user
  before_action :find_order, only:[:show]

  def index
    @orders = current_user.orders.paginate page:
      params[:page], per_page: Settings.per_page
  end

  def show
    @order_details = current_order.order_details
  end

  def update
    @order = current_order
    @order.user = current_user
    if @order.update_attributes status: true
      session.delete :order_id
      flash[:success] = t "order.thanks_order"
    else
      flash[:danger] = t "order.order_failed"
    end
    redirect_to user_orders_path(current_user)
  end

  private
  def order_params
    params.require(:order).permit :user_id, :total_pay, :status
  end

  def find_order
    @order = Order.find_by id: params[:id]
  end
end
