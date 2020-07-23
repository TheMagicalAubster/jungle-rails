class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
    @product_count = Product.all.count
    
  end

  def show
    @product = Product.find params[:id]
  end

end
