# Create categories if they don't

puts 'Start seeding...'

# L'ORDRE DES DESTROY_ALL EST IMPORTANT !!
Tag.destroy_all
Bookmark.destroy_all
Event.destroy_all
Venue.destroy_all
Subcategory.destroy_all
Category.destroy_all
User.destroy_all

puts 'Create user...'
julie = User.create!(email: 'julie.tailleur@gmail.com', password: 'barometre')
pierre = User.create!(email: 'p.quignon.pro@gmail.com', password: 'barometre')
sewan = User.create!(email: 'sewan.bonzom@gmail.com', password: 'barometre')
olivier = User.create!(email: 'olivier.g@lavache.com', password: 'barometre')

puts 'Creating categories...'
# Concert, Jam session, DJ set, Théâtre, Divers
cat_musique = Category.create!(name: 'Musique')
cat_theatre = Category.create!(name: 'Théâtre')
puts 'Categories done !'

puts 'Creating subcategories...'
# These ones are for music unless
concert = Subcategory.create!(name: 'Concert', category_id: cat_musique.id)
dj_set = Subcategory.create!(name: 'DJ Set', category_id: cat_musique.id)
jam_session = Subcategory.create!(name: 'Jam Session', category_id: cat_musique.id)
rock = Subcategory.create!(name: 'Rock', category_id: cat_musique.id)
rap = Subcategory.create!(name: 'Rap', category_id: cat_musique.id)
worl = Subcategory.create!(name: 'World', category_id: cat_musique.id)
folk = Subcategory.create!(name: 'Folk', category_id: cat_musique.id)
electro = Subcategory.create!(name: 'Electro', category_id: cat_musique.id)
jazz = Subcategory.create!(name: 'Jazz', category_id: cat_musique.id)
chanson = Subcategory.create!(name: 'Chanson', category_id: cat_musique.id)
groove = Subcategory.create!(name: 'Groove', category_id: cat_musique.id)
slam = Subcategory.create!(name: 'Slam', category_id: cat_musique.id)
# These ones are for theater
impro = Subcategory.create!(name: 'Impro', category_id: cat_theatre.id)
stand_up = Subcategory.create!(name: 'Stand-up', category_id: cat_theatre.id)
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
jym = Venue.create!(name: 'Jym', address: '39 Quai de Versailles, 44000 Nantes')
cafe_rouge_mecanique = Venue.create!(name: 'Le Cagé Rouge Mécanique', address: '10 rue du bon secours, 44000 Nantes')
poumpoumtchak = Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau 44000 Nantes')
pioche = Venue.create!(name: 'Pioche', address: '10 rue de Bel Air, 44000 Nantes')
arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes')
lune_froide = Venue.create!(name: 'Lune Froide', address: '21 quai de Versailles, 44000 Nantes')
duchesse = Venue.create!(name: 'Duchesse', address: '87 rue Maréchal Joffre, Nantes')
puts 'Venues done !'

puts 'Creating events...'
jim_truc = Event.create!(
  venue_id: jym.id,
  date: DateTime.new(2022, 12, 1, 20),
  name: 'Truc au Jym !',
  description: "C'eeeeeeeeest un événement qui n'a pas de description"
)
poum_cito = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 2, 20),
  name: 'Le Cito au PoumPoum',
  description: "C'eeeeeeeeest un événement qui n'a pas de description non plus"
)
poum_unplugged = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 16, 20),
  name: 'Unplugged Paradise Session au Poum',
  description: "Une incroyable jam bluegrass très conviviale, animée par les merveilleux Félix Masson et Olivier Genel"
)
puts 'Events done !'

puts 'Creating tags...'
Tag.create!(event_id: jim_truc.id, subcategory_id: rap.id)
Tag.create!(event_id: jim_truc.id, subcategory_id: electro.id)

Tag.create!(event_id: poum_cito.id, subcategory_id: impro.id)

Tag.create!(event_id: poum_unplugged.id, subcategory_id: folk.id)
Tag.create!(event_id: poum_unplugged.id, subcategory_id: jam_session.id)
puts 'Tags done !'

puts 'Creating bookmarks...'
Bookmark.create!(event_id: poum_cito.id, user_id: julie.id)
Bookmark.create!(event_id: jim_truc.id, user_id: pierre.id)
Bookmark.create!(event_id: jim_truc.id, user_id: sewan.id)
Bookmark.create!(event_id: poum_unplugged.id, user_id: olivier.id)

puts 'Seeding done !'
