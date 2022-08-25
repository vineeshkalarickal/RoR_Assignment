class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @products = Product.order('created_at DESC')
  end

  # for admin users only
  def list
    if current_user.admin == true
      @products = Product.order('created_at DESC')
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
        redirect_to list_products_path
      else
        flash.now[:error] = 'Could not save'
        render :new
      end

    else
      redirect_to products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def update
    product = Product.find(params[:id])
    product.update(product_params)
    redirect_to list_products_path
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:note] = 'delete record succesfully'
    redirect_to  list_products_path
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :image_url, :quantity, :category_id, :store_id, :details, :discount)
  end
end
