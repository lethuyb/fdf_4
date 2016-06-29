class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order(:created_at).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @categories = Categories.all
    @product = Product.new
  end

  def create
    @product = Product.new product_params
    if @product.save
      flash[:success] = t "application.flash.products.create_success"
      redirect_to admin_products_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit :productName, :price,  :description,
      :quantity, :images, :rating, :categories_id
  end
end
