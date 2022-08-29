# shopping cart
class CartController < ApplicationController
  before_action :authenticate_user!

  def index

    @product = Product.find(params[:id])
    @cart = Cart.where(user_id: current_user.id).first
    # if cart is not found, create a new one
    if @cart.blank?
      @cart = create_cart(current_user.id)      
    end

    item_total = calculate_total(@product.price.to_i, @product.discount.to_i)
    # create a new cart item
    @line_item = LineItem.create(user_id: current_user.id, cart_id: @cart.id, product_id: @product.id, quantity: 1, item_price: @product.price, item_total: item_total, discount: @product.discount)

    @query = " LEFT OUTER JOIN users ON users.user_id = line_items.id "
    #LineItem.joins("")

    flash[:notice] = 'Successfully added to the cart'
  end

  def create_cart(user_id)
    cart = Cart.new(user_id: user_id)
    cart.save
  end

  def calculate_total(price, discount)
    if discount.zero?
      price
    else
      price = price - (price * (discount / 100.0))
    end
  end

end
