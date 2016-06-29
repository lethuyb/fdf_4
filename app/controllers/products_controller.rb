class ProductsController < ApplicationController

  def index
    @products = Product.order(:created_at).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def show
    @product = Product.find_by_id params[:id]
    if @product.nil?
      flash[:danger] = t "flash.no_image"
      redirect_to products_path
    end
  end
end
