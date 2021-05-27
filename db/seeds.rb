# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
restaurant = Restaurant.create({
    name: "Stefan's Place", 
    phone: "555-111-2222",
    email: "stefansplace@gmail.com",
    street_address: "100 Crosby Street",
    city: "New York", 
    state: "NY",
    postal_code: "10010",
    time_zone: "Eastern Time (US & Canada)"
})

menu = Menu.create({
    restaurant: restaurant,
    name: "Breakfast"
})

course = Course.create({
    menu: menu,
    name: "Drinks"
})

schedule = OperationHour.create({
    schedulable: restaurant,
    time_zone: restaurant.time_zone,
    day: 4,
    start_time: 9.5,
    end_time: 17.5
})