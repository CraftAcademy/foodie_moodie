# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = Restaurant.create([{name: 'Indian Fun', address1: 'Snorgatan 12', postal_code: '164 55', phone_number: '1234555', city: 'Kista', cuisine: 'Indian Food', }])
dishes = Dish.create([{title: 'papadom', description: 'deep fried crunchy things', price: 10000, restaurant: restaurants.first}])
