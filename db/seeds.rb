# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts 'Creating events...'
tour_d_argent = Restaurant.new(name: "La Tour d'Argent")
tour_d_argent.save!

chez_gladines = Restaurant.new(name: "Chez Gladines")
chez_gladines.save!
puts 'Finished!'
