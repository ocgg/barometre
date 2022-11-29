# Create categories if they don'tputs 'Seeding starting'

puts 'Creating categories...'
# Concert, Jam session, DJ set, Théâtre, Divers
Category.create!(name: 'Concert') unless Category.find_by(name: 'Concert').present?
Category.create!(name: 'Jam session') unless Category.find_by(name: 'Jam session').present?
Category.create!(name: 'DJ set') unless Category.find_by(name: 'DJ set').present?
Category.create!(name: 'Théâtre') unless Category.find_by(name: 'Théâtre').present?
Category.create!(name: 'Divers') unless Category.find_by(name: 'Divers').present?
puts 'Categories done !'

puts 'Creating subcategories...'
# These ones are for music
Subcategory.create!(name: 'Rock', category: Category.find_by(name: 'Concert')) unless Subcategory.find_by(name: 'Rock').present?
Subcategory.create!(name: 'Rap') unless Subcategory.find_by(name: 'Rap').present?
Subcategory.create!(name: 'World') unless Subcategory.find_by(name: 'World').present?
Subcategory.create!(name: 'Folk') unless Subcategory.find_by(name: 'Folk').present?
Subcategory.create!(name: 'Electro') unless Subcategory.find_by(name: 'Electro').present?
Subcategory.create!(name: 'Jazz') unless Subcategory.find_by(name: 'Jazz').present?
Subcategory.create!(name: 'Chanson') unless Subcategory.find_by(name: 'Chanson').present?
Subcategory.create!(name: 'Groove') unless Subcategory.find_by(name: 'Groove').present?
Subcategory.create!(name: 'Slam') unless Subcategory.find_by(name: 'Slam').present?
# These ones are for theater
Subcategory.create!(name: 'Impro') unless Subcategory.find_by(name: 'Impro').present?
Subcategory.create!(name: 'Stand-up') unless Subcategory.find_by(name: 'Stand-up').present?
# This one is general
Subcategory.create!(name: 'Divers') unless Subcategory.find_by(name: 'Divers').present?
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
Venue.create!(name: 'Jym', address: '39 Quai de Versailles, 44000 Nantes') unless Venue.find_by(name: 'Jym').present?
Venue.create!(name: 'Le Cagé Rouge Mécanique', address: '10 rue du bon secours, 44000 Nantes') unless Venue.find_by(name: 'Jym').present?
Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau 44000 Nantes') unless Venue.find_by(name: "Poum Poum T'chak").present?
Venue.create!(name: 'Pioche', address: '10 rue de Bel Air, 44000 Nantes') unless Venue.find_by(name: 'Pioche').present?
Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes') unless Venue.find_by(name: 'Arlette Café').present?
Venue.create!(name: 'Lune Froide', address: '21 quai de Versailles, 44000 Nantes') unless Venue.find_by(name: 'Lune Froide').present?
Venue.create!(name: 'Duchesse', address: '87 rue Maréchal Joffre, Nantes') unless Venue.find_by(name: 'Duchesse').present?
puts 'Venues done !'

# puts 'Creating events...'
# Event.create!(
#   venue: Venue.find_by(name: ''),
#   subcategory: Subcategory.find_by(name: ''),
#   date:
# )

puts 'done'
