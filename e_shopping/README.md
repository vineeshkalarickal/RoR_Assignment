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


DB Operations:
----------------------------
<%= f.select :product_id,
              options_from_collection_for_select(Product.all, "id", "product_name", f.object.product_id), 
              prompt: "Select something" %>



------------------------
in Controller
-------------
@cart_items = LineItem.left_outer_joins(:user, :cart, :product, :order).group(:product_id).to_sql

in View
-----------------
<%= debug(@cart_items) %>

IRB Query Running
--------------
irb(main):010:0> results = ActiveRecord::Base.connection.execute(' SELECT "line_items".* FROM "line_items" LEFT OUTER JOIN "users" ON "users"."id" = "line_items"."user_id" LEFT OUTER JOIN "carts" ON "carts"."id" = "line_items"."cart_id" LEFT OUTER JOIN "products" ON "products"."id" = "line_items"."product_id" LEFT OUTER JOIN "orders" ON "orders"."id" = "line_items"."order_id" GROUP BY "line_items"."product_id" ')

irb(main):010:0> results.to_a



results = ActiveRecord::Base.connection.execute(' SELECT line_items.id, carts.id, carts.status FROM "line_items" LEFT OUTER JOIN "carts" ON "carts"."id" = "line_items"."cart_id" WHERE (line_items.user_id = 5 and carts.status = 1) ')


