class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :address
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip
      t.boolean :default, default: true

      t.timestamps
    end
  end
end
