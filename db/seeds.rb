# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    

  Product.create([{ product_code:  01, name: "Scotland Flag", price: 20, vat_rate: "zero", pic: "scotland_flag"}, 
                  { product_code:  02, name: "Children’s Car Seat", price: 33.90, vat_rate: "reduce", pic: "car_seat" },
                  { product_code:  03, name: "Magnetic Wrist Band", price: 9, vat_rate: "standar", pic: "band" }])

  Client.create(name: 'Luke')