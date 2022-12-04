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
world = Subcategory.create!(name: 'World', category_id: cat_musique.id)
folk = Subcategory.create!(name: 'Folk', category_id: cat_musique.id)
electro = Subcategory.create!(name: 'Electro', category_id: cat_musique.id)
jazz = Subcategory.create!(name: 'Jazz', category_id: cat_musique.id)
chanson = Subcategory.create!(name: 'Chanson', category_id: cat_musique.id)
groove = Subcategory.create!(name: 'Groove', category_id: cat_musique.id)
slam = Subcategory.create!(name: 'Slam', category_id: cat_musique.id)
blind_test = Subcategory.create!(name: 'Blind Test', category_id: cat_musique.id)
# These ones are for theater
impro = Subcategory.create!(name: 'Impro', category_id: cat_theatre.id)
stand_up = Subcategory.create!(name: 'Stand-up', category_id: cat_theatre.id)
cabaret = Subcategory.create!(name: 'Cabaret', category_id: cat_theatre.id)
caatch = Subcategory.create!(name: 'catch', category_id: cat_theatre.id)
match = Subcategory.create!(name: 'match', category_id: cat_theatre.id)
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
jym = Venue.create!(name: 'Jym', address: '39 Quai de Versailles, Nantes')
cafe_rouge_mecanique = Venue.create!(name: 'Le Cagé Rouge Mécanique', address: '10 rue bon secours, Nantes')
poumpoumtchak = Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau Nantes')
pioche = Venue.create!(name: 'Pioche', address: '10 rue de Bel Air, Nantes')
arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes')
lune_froide = Venue.create!(name: 'Lune Froide', address: '21 Quai de Versailles, Nantes')
duchesse = Venue.create!(name: 'Duchesse', address: '87 rue Maréchal Joffre, Nantes')
puts 'Venues done !'

puts 'Creating events...'
jim_truc = Event.create!(
  venue_id: jym.id,
  date: DateTime.new(2022, 12, 1, 20),
  name: 'Truc au Jym !',
  description: "Il s'agit d'un concert qui associe deux genres musicaux majeurs que sont l'electro et le rap."
)
le_cito = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 1, 20),
  name: 'Le Cito',
  description: "Retrouvez au Poum un catch d'improvisation mené tambour battant par la troupe du Cito (Cours d'improvisation théâtrale de l'Ouest)."
)
poum_la_poulpe_faction = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 1, 20),
  name: 'La poulpe Faction',
  description: "Retrouvez la La Poulpe Faction au Poum pour un cabaret d'improvisation. Venez proposer vos thèmes et découvrir des impros tentaculaires !"
)
jam_tonique = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 3, 21),
  name: 'Jam Tonique',
  description: "Après le succès de la première édition du Jam Tonique il revient au Poum le 3 décembre. Sur place de nombreux instruments sont mis à disposition (clavier, batterie, amplis, guitare, basse et micros). Pour l'occasion public, musicien.nes, chanteur.euses, rappeur.euses sont les bienvenus"
)
blind_test_du_poum = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 9, 20),
  name: 'Blind Test du Poum',
  description: "Une petite soirée calme (ou pas) comme on les aime. Venez participer au blind test du poum le 9 décembre !"
)
poum_comedy_un = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 9, 20),
  name: 'Poum Comedy',
  description: "Du Stand-Up au Poum !? Interactions avec le public, réflexions personnelles, observations quotidiennes, tout y passe pour un spectacle rythmé ou les rires s’enchaînent autour d'un verre."
)
unplugged_paradise_session = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 11, 18),
  name: 'Unplugged Paradise Session au Poum',
  description: "Une incroyable jam bluegrass très conviviale, animée par les merveilleux Félix Masson et Olivier Genel"
)
poum_comedy_deux = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 16, 20),
  name: 'Poum Comedy',
  description: "Du Stand-Up au Poum !? Interactions avec le public, réflexions personnelles, observations quotidiennes, tout y passe pour un spectacle rythmé ou les rires s’enchaînent autour d'un verre."
)
poum_comedy_trois = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 23, 20),
  name: 'Poum Comedy',
  description: "Du Stand-Up au Poum !? Interactions avec le public, réflexions personnelles, observations quotidiennes, tout y passe pour un spectacle rythmé ou les rires s’enchaînent autour d'un verre."
)
les_barbes_rampantes = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 29, 20),
  name: 'Les Barbes rampantes',
  description: "Sur la scène chaleureuse du Poum Poum Tchak retrouvez un cabaret d'improvisation. Un joyeux bazar plein d’émotions et de rebondissements, orchestré par un maître de cérémonie au bagou galvanisant ! "
)
poum_comedy = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 30, 20),
  name: 'Poum Comedy',
  description: "Du Stand-Up au Poum !? Interactions avec le public, réflexions personnelles, observations quotidiennes, tout y passe pour un spectacle rythmé ou les rires s’enchaînent autour d'un verre."
)
arlette_blind = Event.create!(
  venue_id: arlette_cafe.id,
  date: DateTime.new(2022, 12, 7, 20),
  name: 'BlindTest Années 2000',
  description: "Le BLINDTEST ANNÉES 2000 est de retour au Arlette. Retrouvez les musiques les plus mythiques d'une décennie marquée par des hits tous plus mémorables les uns que les autres !"
)
la_derniere_deux = Event.create!(
  venue_id: cafe_rouge_mecanique.id,
  date: DateTime.new(2022, 12, 7, 20),
  name: 'La dernière #2',
  description: "Après l'émotion et les larmes de la dernière scène des Lapins à plumes pour la fermeture du Rouge Mécanique. Après l'immense plaisir de son grand retour tant attendu par l'ensemble des Slameureuses. Voici hélas, une fois encore, la dernière de cette scène mythique...snif snif... Alors si vous l'avez loupé la 1ère fois, ne ratez surtout pas la vraie dernière (avant la prochaine) et venez profiter de cette tribune d'expression extraordinaire."
)
puts 'Events done !'

puts 'Creating tags...'
Tag.create!(event_id: jim_truc.id, subcategory_id: rap.id)
Tag.create!(event_id: jim_truc.id, subcategory_id: electro.id)
Tag.create!(event_id: le_cito.id, subcategory_id: impro.id)
Tag.create!(event_id: le_cito.id, subcategory_id: caatch.id)
Tag.create!(event_id: poum_la_poulpe_faction.id, subcategory_id: impro.id)
Tag.create!(event_id: poum_la_poulpe_faction.id, subcategory_id: cabaret.id)
Tag.create!(event_id: jam_tonique.id, subcategory_id: jam_session.id)
Tag.create!(event_id: blind_test_du_poum.id, subcategory_id: blind_test.id)
Tag.create!(event_id: poum_comedy_un.id, subcategory_id: stand_up.id)
Tag.create!(event_id: unplugged_paradise_session.id, subcategory_id: jam_session.id)
Tag.create!(event_id: unplugged_paradise_session.id, subcategory_id: folk.id)
Tag.create!(event_id: poum_comedy_deux.id, subcategory_id: stand_up.id)
Tag.create!(event_id: poum_comedy_trois.id, subcategory_id: stand_up.id)
Tag.create!(event_id: les_barbes_rampantes.id, subcategory_id: impro.id)
Tag.create!(event_id: les_barbes_rampantes.id, subcategory_id: cabaret.id)
Tag.create!(event_id: poum_comedy.id, subcategory_id: stand_up.id)
Tag.create!(event_id: arlette_blind.id, subcategory_id: blind_test.id)
Tag.create!(event_id: la_derniere_deux.id, subcategory_id: slam.id)
puts 'Tags done !'

puts 'Creating bookmarks...'
Bookmark.create!(event_id: le_cito.id, user_id: julie.id)
Bookmark.create!(event_id: jim_truc.id, user_id: pierre.id)
Bookmark.create!(event_id: jim_truc.id, user_id: sewan.id)
Bookmark.create!(event_id: unplugged_paradise_session.id, user_id: olivier.id)

puts 'Seeding done !'
