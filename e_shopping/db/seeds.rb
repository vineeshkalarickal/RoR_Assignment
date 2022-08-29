# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# 10.times do |x|
#   Products.create(name:"Product#{x}", price:"200", image_url:"path_img_#{x}", quantity:5, store_id:1 )
# end

LineItem.create(user_id: 5, cart_id: 1, product_id: 13, quantity:2, item_price:450, item_total:900, discount:15)
LineItem.create(user_id: 5, cart_id: 1, product_id: 12, quantity:1, item_price:150, item_total:150, discount:0)