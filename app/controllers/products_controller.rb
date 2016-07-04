class ProductsController < ApplicationController
  def index
    @products = Product.order(created_at: :desc).paginate page: params[:page],
      per_page: Settings.per_page
    @order_detail = current_order.order_details.new
  end

  def show
    @product = Product.find_by id: params[:id]
    if @product.nil?
      flash[:danger] = t "flash.no_image"
      redirect_to products_path
    end
    @comments = @product.comments.order(created_at: :desc).paginate page:
      params[:page], per_page: Settings.per_page
    @comment = Comment.new
  end
end
