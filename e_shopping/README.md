# README
`bundle exec rails db:seed`
https://guides.rubyonrails.org/active_record_basics.html

`rails g migration add_admin_to_user admin:boolean`
# change migration file
```sh
class AddAdminToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :admin, :boolean, default: false
  end
end
```
`rails db:migrate`

# DB Operations:
```sh
<%= f.select :product_id,
              options_from_collection_for_select(Product.all, "id", "product_name", f.object.product_id),
              prompt: "Select something" %>
```
# In Controller
```sh
@cart_items = LineItem.left_outer_joins(:user, :cart, :product, :order).group(:product_id).to_sql
```
# In View
```sh
<%= debug(@cart_items) %>
```
# IRB Query Running
```sh
irb(main):010:0> results = ActiveRecord::Base.connection.execute(' SELECT "line_items".* FROM "line_items" LEFT OUTER JOIN "users" ON "users"."id" = "line_items"."user_id" LEFT OUTER JOIN "carts" ON "carts"."id" = "line_items"."cart_id" LEFT OUTER JOIN "products" ON "products"."id" = "line_items"."product_id" LEFT OUTER JOIN "orders" ON "orders"."id" = "line_items"."order_id" GROUP BY "line_items"."product_id" ')
```
```sh
irb(main):010:0> results.to_a
```
```sh
results = ActiveRecord::Base.connection.execute(' SELECT line_items.id, carts.id, carts.status FROM "line_items" LEFT OUTER JOIN "carts" ON "carts"."id" = "line_items"."cart_id" WHERE (line_items.user_id = 5 and carts.status = 1) ')
```
# RSpec

https://rubydoc.info/gems/rspec-rails/frames

# Run against this stable release
group :development, :test do
  `gem 'rspec-rails', '~> 5.0.0'`
  - bundle install
  - rails generate rspec:install or [ bundle update rspec-rails ]

# RSpec also provides its own spec file generators
rails generate rspec:model user
  - create  spec/models/user_spec.rb

# How to Run the Tests
> Once everything is configured, you are ready to go! There are four ways to run your test:

- Everything at once: `bundle exec rspec`
--This runs all your tests.

- One RSpec package: `bundle exec rspec ./spec/models`
--This runs all model specs.

- One RSpec file at a time: `bundle exec rspec ./spec/models/story_spec.rb`
--This runs only tests in the Story model.

- One by one: `bundle exec rspec ./spec/models/story_spec.rb:10`
--This runs only tests on line 10 in the Story model.

> Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
  `bundle exec rspec`

### Run all spec files in a single directory (recursively)
`bundle exec rspec spec/models`
### Run a single spec file
`bundle exec rspec spec/controllers/accounts_controller_spec.rb`
# Run a single example from a spec file (by line number)
`bundle exec rspec spec/controllers/accounts_controller_spec.rb:8`

> See all options for running specs
`bundle exec rspec --help`

> Run db migrations for test
rails db:migrate RAILS_ENV=test


