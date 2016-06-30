class Admin::ProductsController < ApplicationController
  before_action: load_category, only:[:new, :edit]
  before_action: find_product, only:[:edit, :show]
  def index
    @products = Product.order(:created_at).paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
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

  def edit
  end

  def show
  end

  def update
    if @product.update_attributes product_params
      flash[:success] = t "application.flash.products.updated_success"
      redirect_to admin_product_path @product
    else
      flash[:error] = t "application.flash.products.updated_error"
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit :product_name, :price,  :description,
      :quantity, :images, :rating, :categories_id
  end

  def load_category
    @categories = Categories.all
  end

  def find_product
    @product=Product.find_by id: params[:id]
  end
end
