module AddressesHelper

  def primary_address(user_id)
    @default_address = Address.where(default: true, user_id: user_id).first
  end

end
