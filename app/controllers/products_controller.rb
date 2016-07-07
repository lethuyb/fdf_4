class ProductsController < ApplicationController
  def index
    @products = Product.price(params[:price]).product_name(params[:product_name])
        .order(created_at: :desc).paginate page: params[:page],
        per_page: Settings.per_page
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
