class OrderDetailsController < ApplicationController
  before_action :find_order,  only:[:show, :index]

  def create
    @order = current_order
    @order_detail = @order.order_details.new order_detail_params
    @product_numbers = @order_detail.product.quantity - order_detail_params[:quantity_ordered].to_i
    @order_detail.price_each = Product.find(order_detail_params[:product_id]).price
    @order.save
    session[:order_id] = @order.id
    respond_to do |format|
      format.html {redirect_to @order_detail}
      format.js
    end
  end

  def show
    @order_details = current_order.order_details
  end

  def update
    @order = current_order
    @order_detail = @order.order_details.find_by id: params[:id]
    @order_detail.update_attributes order_detail_params
    @order_details = @order.order_details
  end

  def destroy
    @order = current_order
    @order_detail = @order.order_details.find_by id: params[:id]
    @order_detail.destroy
    @order_details = @order.order_details
  end

  private
  def order_detail_params
    params.require(:order_detail).permit :quantity_ordered, :product_id
  end
end
