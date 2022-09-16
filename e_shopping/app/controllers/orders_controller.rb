class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_user_check, only: [:order_list]
  include AddressesHelper

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart = Cart.where(id: @order.cart_id, user_id: @order.user_id).first.update(status: false)
      flash[:notice] = 'Your order placed successfully!'
      redirect_to view_order_path
    else
      flash.now[:error] = 'Could not save'
      render :new
    end
  end

  def view
    # @orders = Order.where(user_id: current_user.id).order('created_at DESC')
    @orders = current_user.orders
  end

  def order_list
    @orders = Order.where(user_id: current_user.id).order('created_at DESC')
  end

  def view_details
    @order = Order.find(params[:id])
    @address = get_address(@order.address_id, @order.user_id)

    @order_items = LineItem.select('line_items.*, products.*, carts.id,  SUM(line_items.quantity) as tot_items').left_outer_joins( :cart, :product ).group(:product_id).where(
      ['line_items.user_id = :user_id and line_items.cart_id = :cart_id',
       { user_id: @order.user_id, cart_id: @order.cart_id }]
    )
    
  end

  def download_order

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",
        template: "orders/view_details.html.erb"   # Excluding ".pdf" extension.
      end
    end
    
  end


  def place_order
    @place_order_items = 
    LineItem.select('line_items.*, products.*, carts.id,  SUM(line_items.quantity) as tot_items').left_outer_joins( :cart, :product ).group(:product_id).where(
      ['line_items.user_id = :user_id and line_items.cart_id = :cart_id',
       { user_id: params[:user_id], cart_id: params[:cart_id] }]
    )
    @shipping_address = primary_address(current_user.id)
  end

  def admin_user_check
    redirect_to view_order_path, notice: "User #{params[:user_id]} not authorized to view the requested page" unless current_user.admin
  end

  private 

  def order_params
    params.require(:order).permit(:user_id, :address_id, :cart_id, :final_price, :order_status)
  end
end
