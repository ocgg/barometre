# Create categories if they don't

puts 'Start seeding...'

Event.destroy_all
Venue.destroy_all
Subcategory.destroy_all
Category.destroy_all

puts 'Create user...'
User.create!(email: 'julie.tailleur@gmail.com', password: 'barometre') unless User.find_by(email: 'julie.tailleur@gmail.com').present?

puts 'Creating categories...'
# Concert, Jam session, DJ set, Théâtre, Divers
cat_musique = Category.find_by(name: 'Musique').present? ? Category.find_by(name: 'Musique') : Category.create!(name: 'Musique')
cat_theatre = Category.create!(name: 'Théâtre').present? ? Category.find_by(name: 'Théâtre') : Category.create!(name: 'Théâtre')
puts 'Categories done !'

puts 'Creating subcategories...'
# These ones are for music unless
concert = Subcategory.find_by(name: 'Concert').present? ? Subcategory.find_by(name: 'Concert') : Subcategory.create!(name: 'Concert', category_id: cat_musique.id)
djset = Subcategory.find_by(name: 'DJ Set').present? ? Subcategory.find_by(name: 'DJ Set') : Subcategory.create!(name: 'DJ Set', category_id: cat_musique.id)
# Subcategory.create!(name: 'Jam Session', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Jam Session').present?
# Subcategory.create!(name: 'Rock', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Rock').present?
# Subcategory.create!(name: 'Rap', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Rap').present?
# Subcategory.create!(name: 'World', category_id: cat_musique.id) unless Subcategory.find_by(name: 'World').present?
# Subcategory.create!(name: 'Folk', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Folk').present?
# Subcategory.create!(name: 'Electro', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Electro').present?
# Subcategory.create!(name: 'Jazz', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Jazz').present?
# Subcategory.create!(name: 'Chanson', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Chanson').present?
# Subcategory.create!(name: 'Groove', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Groove').present?
# Subcategory.create!(name: 'Slam', category_id: cat_musique.id) unless Subcategory.find_by(name: 'Slam').present?
# # These ones are for theater
# Subcategory.create!(name: 'Impro', category_id: cat_theatre.id) unless Subcategory.find_by(name: 'Impro').present?
# Subcategory.create!(name: 'Stand-up', category_id: cat_theatre.id) unless Subcategory.find_by(name: 'Stand-up').present?
# This one is general
# Subcategory.create!(name: 'Divers') unless Subcategory.find_by(name: 'Divers').present?
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
jym = Venue.find_by(name: 'Jym').present? ? Venue.find_by(name: 'Jym') : Venue.create!(name: 'Jym', address: '39 Quai de Versailles, 44000 Nantes')
caferougemecanique = Venue.find_by(name: 'Le Cagé Rouge Mécanique').present? ? Venue.find_by(name: 'Le Cagé Rouge Mécanique') : Venue.create!(name: 'Le Cagé Rouge Mécanique', address: '10 rue du bon secours, 44000 Nantes')
poumpoumtchak = Venue.find_by(name: "Poum Poum T'chak").present? ? Venue.find_by(name: "Poum Poum T'chak") : Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau 44000 Nantes')
# Venue.create!(name: 'Pioche', address: '10 rue de Bel Air, 44000 Nantes') unless Venue.find_by(name: 'Pioche').present?
# Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes') unless Venue.find_by(name: 'Arlette Café').present?
# Venue.create!(name: 'Lune Froide', address: '21 quai de Versailles, 44000 Nantes') unless Venue.find_by(name: 'Lune Froide').present?
# Venue.create!(name: 'Duchesse', address: '87 rue Maréchal Joffre, Nantes') unless Venue.find_by(name: 'Duchesse').present?
puts 'Venues done !'

puts 'Creating events...'
Event.create!(
  venue_id: jym.id,
  date: DateTime.new(2022, 12, 1, 20),
  name: 'Truc au Jym !',
  description: "C'eeeeeeeeest un événement qui n'a pas de description"
)
Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 2, 20),
  name: 'Le Cito au PoumPoum',
  description: "C'eeeeeeeeest un événement qui n'a pas de description non plus"
)
Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 16, 20),
  name: 'Unplugged Paradise Session au Poum',
  description: "Une incroyable jam bluegrass très conviviale, animée par les merveilleux Félix Masson et Olivier Genel"
)

puts 'done'
