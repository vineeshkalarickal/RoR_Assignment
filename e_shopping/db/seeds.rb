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

Product.create(name: "Lumix Camera", price: 320, image_url: "3", quantity: 13, category_id: "1", store_id: "1", details: "Lorem ipsonem mtelw itelcmg oertvl basl", discount: "50")
Product.create(name: "Fuji DSLR", price: 750, image_url: "4", quantity: 10, category_id: "1", store_id: "1", details: "Lorem ipsonem mtelw itelcmg oertvl basl psonem mtelw itelcmg oertvl basl", discount: "50")
Product.create(name: "Nikon DSLR", price: 750, image_url: "5", quantity: 10, category_id: "1", store_id: "1", details: "Lorem ipsonem mtelw itelcmg oertvl basl psonem mtelw itelcmg oertvl basl", discount: "50")
Product.create(name: "Nikon DSLR", price: 850, image_url: "6", quantity: 10, category_id: "1", store_id: "1", details: "Lorem ipsonem mtelw itelcmg oertvl basl psonem mtelw itelcmg oertvl basl", discount: "50")
Product.create(name: "Lee Cooper", price: 850, image_url: "b1", quantity: 10, category_id: "1", store_id: "1", details: "Lorem ipsonem mtelw itelcmg oertvl basl psonem mtelw itelcmg oertvl basl", discount: "50")
