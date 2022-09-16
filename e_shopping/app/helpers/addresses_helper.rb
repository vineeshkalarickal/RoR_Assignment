module AddressesHelper

  def primary_address(user_id)
    @default_address = Address.where(default: true, user_id: user_id).first
  end

  def get_address(address_id, user_id)
    @address = Address.select('*').left_outer_joins(:user).where(id: address_id, user_id: user_id).first
  end  

end
