class AddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    # @addresses = Address.order('created_at ASC').where(user_id: current_user.id)
    # using association model
    @addresses = current_user.addresses
  end

  def new
    @address = Address.new
  end

  def create
    
    @address = Address.new(address_params)
    @address.user = current_user
    if @address.save
      if @address.default == true
        Address.where.not(id: @address.id).update_all(default: false)
      end
      flash[:notice] = 'Saved Successfully!'
      redirect_to addresses_path
    else
      flash.now[:error] = 'Could not save'
      render :new
    end
  end

  def edit
    @address = Address.find(params[:id])
    render :edit
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)

    if @address.default == true
      Address.where.not(id: params[:id]).update_all(default: false)
    end

    redirect_to addresses_path
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    flash[:note] = 'delete record succesfully'
    redirect_to  addresses_path
  end

  private

  def set_address
    @address = Address.find(params[:id])
  end

  def address_params
    params.require(:address).permit(:address, :street, :city, :state, :zip, :default)
  end
end
