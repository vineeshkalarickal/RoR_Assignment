class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def view_product
    @product = Product.find(params[:id])
  end

end
