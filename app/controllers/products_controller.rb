class ProductsController < ApplicationController

  def index
     @products = Product.order(:created_at).paginate page: params[:page],
       per_page: Settings.per_page
  end
end
