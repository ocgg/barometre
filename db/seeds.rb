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
arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes')
decadanse = Venue.create!(name: 'Décadanse', address: '1 boulevard Henry Orrion, Nantes')
zygobar = Venue.create!(name: 'Le Zygo Bar', address: '35, rue des Olivettes, Nantes')
hopopop = Venue.create!(name: 'Hopopop Café', address: '6 allée du Port Maillard, Nantes')
puts 'Venues done !'

puts 'Creating events...'
jim_standup = Event.create!(
  venue_id: jym.id,
  date: DateTime.new(2022, 12, 15, 20),
  name: 'Show time stand-up et théâtre',
  description: "2 jeudis par mois, décompressez en rigolant avec des humoristes nantais ! Les autres jeudis, retrouvez les troupes de théâtre CITO ou Sympa'TIC !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/314409028_1123022908343815_3054039397338768162_n.jpg?stp=dst-jpg_p960x960&_nc_cat=111&ccb=1-7&_nc_sid=340051&_nc_ohc=xgS_PJU29PkAX-JlA58&_nc_ht=scontent-cdg2-1.xx&oh=00_AfCTLnbwg38YCh_SQjw8HWiybOqt9l83LIxBlZHDY3fCOg&oe=6392B31A")
jim_standup.photo.attach(io: file, filename: "jim_standup.jpg", content_type: "image/jpg")
jim_standup.save

jim_karaoke = Event.create!(
  venue_id: jym.id,
  date: DateTime.new(2022, 12, 14, 20),
  name: 'Soirée Karaoké au Jym',
  description: "Tous les mercredis au JYM, échauffez votre voix et réveillez la star qui sommeille en vous."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/306005642_1077493432896763_5212649048974768455_n.jpg?stp=dst-jpg_p960x960&_nc_cat=109&ccb=1-7&_nc_sid=340051&_nc_ohc=9hdvyrykPa8AX-jfG6W&_nc_ht=scontent-cdt1-1.xx&oh=00_AfB4rr6FSbQd50e-rxUJ4KQoY4YVL-CQQL5V__wRT1g_Iw&oe=6391C240")
jim_karaoke.photo.attach(io: file, filename: "jim_karaoke.jpg", content_type: "image/jpg")
jim_karaoke.save

blind_test_du_poum = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 9, 20),
  name: 'Blind Test du Poum',
  description: "Une petite soirée calme (ou pas) comme on les aime. Venez participer au blind test du poum le 9 décembre !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/311899351_5502496649843615_2373007547358726341_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=340051&_nc_ohc=zXXLD5gFUwkAX84OnMh&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBa4vNY2qCcybOyiq1CDkM6_Foi9yaQuymIQu_4zvQB5g&oe=6391E81B")
blind_test_du_poum.photo.attach(io: file, filename: "blind_test_du_poum.jpg", content_type: "image/jpg")
blind_test_du_poum.save

la_44_deux_fievre = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 15, 21),
  name: 'La 44.2 Fièvre au Poum',
  description: "Dernier concert de l'année pour la 44.2 Fièvre !
  Une année bien remplie avec de nouveaux morceaux, de nouvelles acrobaties, plus de déhanché et encore plus d'ambiance !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/318304962_519718320197992_8034251445748193653_n.jpg?stp=dst-jpg_p960x960&_nc_cat=108&ccb=1-7&_nc_sid=340051&_nc_ohc=x1r4a9N5HZoAX_T9L2F&tn=VTjhqTISxxN1y_Lw&_nc_ht=scontent-cdg2-1.xx&oh=00_AfDWTin6ynCPWCyUaDx3yt5314nT3TbaanyT87dRCkVuXw&oe=6391F423")
la_44_deux_fievre.photo.attach(io: file, filename: "la_44_deux_fievre.jpg", content_type: "image/jpg")
la_44_deux_fievre.save

arlette_blind = Event.create!(
  venue_id: arlette_cafe.id,
  date: DateTime.new(2022, 12, 23, 20),
  name: 'BlindTest Années 2000',
  description: "Le BLINDTEST ANNÉES 2000 est de retour au Arlette. Retrouvez les musiques les plus mythiques d'une décennie marquée par des hits tous plus mémorables les uns que les autres !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/316427002_574927171300608_5774605556541412323_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=xXWKoEQB2vsAX9X2btG&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAPTkWV0lW9cyELfV8RMnzxPuXf414I8bsiRkUMymJSgQ&oe=6391DF5F")
arlette_blind.photo.attach(io: file, filename: "arlette_blind.jpg", content_type: "image/jpg")
arlette_blind.save

arlette_dj_chol = Event.create!(
  venue_id: arlette_cafe.id,
  date: DateTime.new(2023, 1, 6, 22),
  name: 'DJ CHOL & JATHIEU HOUSE TECHNO',
  description: "Venez au Arlette café à partir de 21h pour kiffer sur les sons house/techno survitaminés de DJ CHOL & JATHIEU ! Places limitées !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/301547313_507672221359437_1408504075618823013_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gRTZO7JRNnsAX-AQ10I&_nc_ht=scontent-cdt1-1.xx&oh=00_AfB50wxmCJEvvUAQssNqhdRUm7guAqRB6btnIy5BTp-eOA&oe=6391CA58")
arlette_dj_chol.photo.attach(io: file, filename: "arlette_dj_chol.jpg", content_type: "image/jpg")
arlette_dj_chol.save

la_derniere_deux = Event.create!(
  venue_id: cafe_rouge_mecanique.id,
  date: DateTime.new(2022, 12, 7, 19),
  name: 'La dernière #2',
  description: "Après l'émotion et les larmes de la dernière scène des Lapins à plumes pour la fermeture du Rouge Mécanique. Après l'immense plaisir de son grand retour tant attendu par l'ensemble des Slameureuses. Voici hélas, une fois encore, la dernière de cette scène mythique...snif snif... Alors si vous l'avez loupé la 1ère fois, ne ratez surtout pas la vraie dernière (avant la prochaine) et venez profiter de cette tribune d'expression extraordinaire."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/306269728_516294783832142_8794255962981862975_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uSgaAZfNfQQAX8N5JAj&_nc_oc=AQkjJibkhdl70LtIfcEsk0y2JLCITRYg7N0BzWLDM-x9ZCDzKoFNGrv7LmwTELZbtgbyW0IVxTxcY1n1_czouYDr&_nc_ht=scontent-cdt1-1.xx&oh=00_AfC_Q4judFPKH4qXF49OFc5vHNJDcD-pzxtUOap3Mn7KiQ&oe=63928749")
la_derniere_deux.photo.attach(io: file, filename: "la_derniere_deux.jpg", content_type: "image/jpg")
la_derniere_deux.save

moustache_georges = Event.create!(
  venue_id: cafe_rouge_mecanique.id,
  date: DateTime.new(2023, 1, 19, 21),
  name: 'Sous la Moustache de Georges au Rouge Mécanique !',
  description: "Sous la Moustache de Georges revient au Rouge Mécanique pour explorer le répertoire intemporel de Brassens en compagnie de Margot, Fernande et les autres..."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/316129645_794836428421908_4500654684748643179_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=340051&_nc_ohc=NZB2i8kpYrcAX8LZ7wE&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCPdUlt_PP-NSIxgOfl5F09M7j0660fgbSGBnxtp4Nveg&oe=6392F5C7")
moustache_georges.photo.attach(io: file, filename: "moustache_georges.jpg", content_type: "image/jpg")
moustache_georges.save

fasme = Event.create!(
  venue_id: decadanse.id,
  date: DateTime.new(2023, 2, 3, 21),
  name: 'Fasme en live',
  description: "Le Nantais à l'énergie débordante nous fera voyager avec sa musique en constante évolution, entre electro, acid, braindance et synth-wave, et une mélodie subtile et mélancolique. Première partie TBA. Billetterie ouverte ! Quantité de billets limitée = réservation conseillée."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/317829102_2333815240120939_4559325730787944032_n.jpg?stp=dst-jpg_p960x960&_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=_QZ-9JyRa44AX8fJt1E&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAN4NK3KTuqxAVpdyOOFi_6uXzT7cisAoUltTXtKMOrCQ&oe=63936C88")
fasme.photo.attach(io: file, filename: "fasme.jpg", content_type: "image/jpg")
fasme.save
max_genouel = Event.create!(
  venue_id: zygobar.id,
  date: DateTime.new(2022, 12, 18, 18),
  name: 'Max Genouel - Texas Blues Revue',
  description: "Max Genouel invite Tbo Ripault, Julien Bouyssou et Hugo Deviers pour une série de concerts dans le style Texas Blues !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/318297565_10228791376750593_6454233997399510074_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=340051&_nc_ohc=b3bjjzHMY0kAX8J-v_3&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAEcwY8Zn-zkNOhCwOEcJFTK83BZ3b1XzieDFadAU48CA&oe=63928BF4")
max_genouel.photo.attach(io: file, filename: "max_genouel.jpg", content_type: "image/jpg")
max_genouel.save

jam_hopopop = Event.create!(
  venue_id: hopopop.id,
  date: DateTime.new(2022, 12, 16, 19),
  name: 'Jam session groove',
  description: "Le Hopopop Café vous invite à venir profiter d'une jam session groove, une bière/personne offerte, pensez à réserver!"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/317832724_579930717469736_945885906850458252_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=e3f864&_nc_ohc=XDwW3FayQ6MAX-2i1Cx&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAsABO7I06FQasAJOem5_yp-IVBErgVEWr3Vut9fczfPQ&oe=639314D4")
jam_hopopop.photo.attach(io: file, filename: "jam_hopopop.jpg", content_type: "image/jpg")
jam_hopopop.save

impro_hopopop = Event.create!(
  venue_id: hopopop.id,
  date: DateTime.new(2023, 1, 18, 20),
  name: "Théatre d'improvisation au Hopopop Café",
  description: "Seule l’envie de s’amuser compte pour monter sur scène ! Le 18 Janvier, le Hopopop café organise une scène ouverte accessible à toutes et tous, improvisateurs et improvisatrices d’un jour ou de toujours !"
)
file = URI.open("https://img.restaurantguru.com/r7b8-HoPoPop-Cafe-logo.jpg")
impro_hopopop.photo.attach(io: file, filename: "impro_hopopop.jpg", content_type: "image/jpg")
impro_hopopop.save
puts 'Events done !'

puts 'Creating tags...'
Tag.create!(event_id: jim_standup.id, subcategory_id: stand_up.id)
Tag.create!(event_id: jim_karaoke.id, subcategory_id: chanson.id)
Tag.create!(event_id: blind_test_du_poum.id, subcategory_id: blind_test.id)
Tag.create!(event_id: la_44_deux_fievre.id, subcategory_id: concert.id)
Tag.create!(event_id: la_44_deux_fievre.id, subcategory_id: world.id)
Tag.create!(event_id: arlette_blind.id, subcategory_id: blind_test.id)
Tag.create!(event_id: arlette_dj_chol.id, subcategory_id: dj_set.id)
Tag.create!(event_id: arlette_dj_chol.id, subcategory_id: electro.id)
Tag.create!(event_id: la_derniere_deux.id, subcategory_id: slam.id)
Tag.create!(event_id: la_derniere_deux.id, subcategory_id: concert.id)
Tag.create!(event_id: moustache_georges.id, subcategory_id: concert.id)
Tag.create!(event_id: moustache_georges.id, subcategory_id: chanson.id)
Tag.create!(event_id: fasme.id, subcategory_id: electro.id)
Tag.create!(event_id: fasme.id, subcategory_id: dj_set.id)
Tag.create!(event_id: max_genouel.id, subcategory_id: groove.id)
Tag.create!(event_id: max_genouel.id, subcategory_id: concert.id)
Tag.create!(event_id: jam_hopopop.id, subcategory_id: jam_session.id)
Tag.create!(event_id: jam_hopopop.id, subcategory_id: groove.id)
Tag.create!(event_id: impro_hopopop.id, subcategory_id: impro.id)
puts 'Tags done !'

puts 'Seeding done !'
