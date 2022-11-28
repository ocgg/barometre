# Create categories if they don't exist
puts 'Seeding starting'

puts 'Creating categories...'
# Concert, Jam session, DJ set, Théâtre, Divers
Category.create!(name: 'Concert') unless Category.were(name: 'Concert').exist?
Category.create!(name: 'Jam session') unless Category.were(name: 'Jam session').exist?
Category.create!(name: 'DJ set') unless Category.were(name: 'DJ set').exist?
Category.create!(name: 'Théâtre') unless Category.were(name: 'Théâtre').exist?
Category.create!(name: 'Divers') unless Category.were(name: 'Divers').exist?
puts 'Categories done !'

puts 'Creating subcategories...'
# These ones are for music
Subcategory.create!(name: 'Rock') unless Category.were(name: 'Rock').exist?
Subcategory.create!(name: 'Rap') unless Category.were(name: 'Rap').exist?
Subcategory.create!(name: 'World') unless Category.were(name: 'World').exist?
Subcategory.create!(name: 'Folk') unless Category.were(name: 'Folk').exist?
Subcategory.create!(name: 'Electro') unless Category.were(name: 'Electro').exist?
Subcategory.create!(name: 'Jazz') unless Category.were(name: 'Jazz').exist?
Subcategory.create!(name: 'Chanson') unless Category.were(name: 'Chanson').exist?
Subcategory.create!(name: 'Groove') unless Category.were(name: 'Groove').exist?
# These ones are for theater
Subcategory.create!(name: 'Impro') unless Category.were(name: 'Impro').exist?
Subcategory.create!(name: 'Stand-up') unless Category.were(name: 'Stand-up').exist?
# This one is general
Subcategory.create!(name: 'Divers') unless Category.were(name: 'Divers').exist?
puts 'Subcategories done !'

puts 'Creating venues...'
