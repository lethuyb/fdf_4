class Admin::OrdersController < ApplicationController

 def index
    @orders = Order.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.per_page
  end
end
