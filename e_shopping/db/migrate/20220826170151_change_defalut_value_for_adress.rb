class ChangeDefalutValueForAdress < ActiveRecord::Migration[7.0]
  def change
    change_column_default :addresses, :default, from: true, to: false
  end
end
