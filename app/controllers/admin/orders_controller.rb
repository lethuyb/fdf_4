class Admin::OrdersController < ApplicationController
  before_action :find_order, only:[:show]
  def index
    @orders = Order.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show

  end

  private
  def find_order
    @order = Order.find_by id: params[:id]
  end

end
