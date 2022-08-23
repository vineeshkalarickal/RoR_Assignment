class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    drop_table :users
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.boolean :admin_user
      t.string :password_digest

      t.timestamps
    end
  end
end
