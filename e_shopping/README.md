# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

bundle exec rails db:seed
https://guides.rubyonrails.org/active_record_basics.html


rails g migration add_admin_to_user admin:boolean

-- change migration file

class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end


rails db:migrate



<%= f.select :product_id,
              options_from_collection_for_select(Product.all, "id", "product_name", f.object.product_id), 
              prompt: "Select something" %>