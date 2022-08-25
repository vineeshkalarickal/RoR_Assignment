class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  # for admin users only
  def list
    if current_user.admin == true
      @products = Product.all
    else
      redirect_to products_path
    end
  end

  def admin_view
    if current_user.admin == true
      @product = Product.find(params[:id])
    else
      redirect_to products_path
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  # show product add form
  def new
    if current_user.admin == true
      @product = Product.new
    else
      redirect_to products_path
    end
  end

  def create
    if current_user.admin == true
      product = Product.new(product_params)

      if product.save
        flash[:notice] = 'Saved Successfully!'
        redirect_to product
      else
        flash.now[:error] = 'Could not save'
      end

    else
      redirect_to products_path
    end
  end

  def update
    @product = Product.find(params[:id])
    @product.update(products_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:note] = 'delete record succesfully'
    redirect_to  products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image_url, :quantity, :category_id, :store_id, :details, :discount)
  end
end
