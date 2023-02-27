# Create categories if they don't

puts 'Start seeding...'

# L'ORDRE DES DESTROY_ALL EST IMPORTANT !!
Tag.destroy_all
Bookmark.destroy_all
Event.destroy_all
# Venue.destroy_all
# Subcategory.destroy_all
# Category.destroy_all
User.destroy_all


puts 'Create user...'
julie = User.create!(email: 'julie.tailleur@gmail.com', password: 'barometre', admin: true)
pierre = User.create!(email: 'p.quignon.pro@gmail.com', password: 'barometre', admin: true)
olivier = User.create!(email: 'olivier.g@lavache.com', password: 'barometre', admin: true)

# puts 'Creating categories...'
# # Concert, Jam session, DJ set, Théâtre, Divers
# cat_musique = Category.create!(name: 'Musique')
# cat_theatre = Category.create!(name: 'Théâtre')
# puts 'Categories done !'

# puts 'Creating subcategories...'
# # These ones are for music unless
# concert = Subcategory.create!(name: 'Concert', category_id: cat_musique.id)
# dj_set = Subcategory.create!(name: 'DJ Set', category_id: cat_musique.id)
# jam_session = Subcategory.create!(name: 'Jam Session', category_id: cat_musique.id)
# rock = Subcategory.create!(name: 'Rock', category_id: cat_musique.id)
# rap = Subcategory.create!(name: 'Rap', category_id: cat_musique.id)
# world = Subcategory.create!(name: 'World', category_id: cat_musique.id)
# folk = Subcategory.create!(name: 'Folk', category_id: cat_musique.id)
# electro = Subcategory.create!(name: 'Electro', category_id: cat_musique.id)
# jazz = Subcategory.create!(name: 'Jazz', category_id: cat_musique.id)
# chanson = Subcategory.create!(name: 'Chanson', category_id: cat_musique.id)
# groove = Subcategory.create!(name: 'Groove', category_id: cat_musique.id)
# slam = Subcategory.create!(name: 'Slam', category_id: cat_musique.id)
# blind_test = Subcategory.create!(name: 'Blind Test', category_id: cat_musique.id)
# karaoke = Subcategory.create!(name: 'Karaoké', category_id: cat_musique.id)
# metal = Subcategory.create!(name: 'Métal', category_id: cat_musique.id)
# blues = Subcategory.create!(name: 'Blues', category_id: cat_musique.id)
# # These ones are for theater
# impro = Subcategory.create!(name: 'Impro', category_id: cat_theatre.id)
# stand_up = Subcategory.create!(name: 'Stand-up', category_id: cat_theatre.id)
# cabaret = Subcategory.create!(name: 'Cabaret', category_id: cat_theatre.id)
# caatch = Subcategory.create!(name: 'Catch', category_id: cat_theatre.id)
# match = Subcategory.create!(name: 'Match', category_id: cat_theatre.id)
# puts 'Subcategories done !'

# puts 'Creating venues...'
# # These are real bars
# jym = Venue.create!(name: 'Jym', address: '39 Quai de Versailles, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/310554118_522195616579796_3242283571048074414_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=F-LGPpdJ308AX_1U26J&_nc_ht=scontent-cdg2-1.xx&oh=00_AfBCfWEbrPyyTFCwRstUdjqUR93uISPFMxqrf7ukq7v2rg&oe=6393BD57")
# jym.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
# jym.save

# cafe_rouge_mecanique = Venue.create!(name: 'Le Café Rouge Mécanique', address: '10 rue bon secours, Nantes', confirmed: true)
# file = URI.open("https://images.noveltys.fr/locations/914/medium/le-cafe-rouge-mecanique@nantes.jpg")
# cafe_rouge_mecanique.photo.attach(io: file, filename: "cafe_rouge_mecanique.jpg", content_type: "image/jpg")
# cafe_rouge_mecanique.save

# poumpoumtchak = Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau Nantes', confirmed: true)
# file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/has8cs5lv4rb5x53rnstdv9ge905.png")
# poumpoumtchak.photo.attach(io: file, filename: "poumpoumtchak.jpg", content_type: "image/jpg")
# poumpoumtchak.save

# arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/301547313_507672221359437_1408504075618823013_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gRTZO7JRNnsAX-AQ10I&_nc_ht=scontent-cdt1-1.xx&oh=00_AfC5GJaKKuDeMm8FoJhDANJVnCT6q1SMC4wBjnj2fxDb5w&oe=6393C498")
# arlette_cafe.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
# arlette_cafe.save

# decadanse = Venue.create!(name: 'Décadanse', address: '1 boulevard Henry Orrion, Nantes', confirmed: true)
# file = URI.open("https://metropole.nantes.fr/files/images/culture-patrimoine/decadanse800.jpg")
# decadanse.photo.attach(io: file, filename: "decadanse.jpg", content_type: "image/jpg")
# decadanse.save

# zygobar = Venue.create!(name: 'Le Zygo Bar', address: '35, rue des Olivettes, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/278052498_443057904286788_6465927659910487482_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2tq_QI_DUCgAX8cvcF-&tn=VTjhqTISxxN1y_Lw&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDqIIYrExBAQfA2DJjsND3Zf6VJkXvV7Ly8Wp9NaggpxA&oe=6392B981")
# zygobar.photo.attach(io: File.open('app/assets/images/zygobar.jpg'), filename: "zygobar.jpg", content_type: "image/jpg")
# zygobar.save

# hopopop = Venue.create!(name: 'Hopopop Café', address: '6 allée du Port Maillard, Nantes', confirmed: true)
# file = URI.open("https://www.unidivers.fr/wp-content/uploads/2022/11/hopopop-nantes-2022-vendredi-25-novembre-21h00-2022-11-25t2100000100.jpg")
# hopopop.photo.attach(io: file, filename: "hopopop.jpg", content_type: "image/jpg")
# hopopop.save

# atelierdudahu = Venue.create!(name: 'Atelier du Dahu', address: '26 Bd de Chantenay, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/311643157_101876086050201_5338119424858272314_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_Pcnb7dDxGAAX-b08Oi&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAXx66GoFNI-q-YgAc_eMdJaZ4dDRbsvao3MlQu0R1tCA&oe=6395AB88")
# atelierdudahu.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
# atelierdudahu.save

# wattignies = Venue.create!(name: 'Wattignies', address: '13 Boulevard des Martyrs Nantais de la Résistance, Nantes', confirmed: true)
# file = URI.open("https://www.iledenantes.com/wp-content/uploads/2021/05/wattignies_2-848x301.png")
# wattignies.photo.attach(io: file, filename: "wattignies.jpg", content_type: "image/jpg")
# wattignies.save

# livebar = Venue.create!(name: 'Live Bar', address: '7 rue des Etats, Nantes', confirmed: true)
# file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/xdbh6k1zwrhcu1zc2lfbuzmqcoga.png")
# livebar.photo.attach(io: file, filename: "livebar.jpg", content_type: "image/jpg")
# livebar.save

# mononcle = Venue.create!(name: 'Mon Oncle', address: '16 rue d\'Alger, Nantes, France', confirmed: true)
# file = URI.open("https://lestransbordeurs.com/blog/wp-content/uploads/2016/11/Mon-Oncle-rue-Alger.png")
# mononcle.photo.attach(io: file, filename: "mononcle.jpg", content_type: "image/jpg")
# mononcle.save

# terrassedelile = Venue.create!(name: 'Terrasse de l\'ile', address: '21 quai des Antilles, Nantes', confirmed: true)
# file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUXUPglKogCFG5YtanC5ywYbDqLwDkFZpB6nDBswP8l7_i-vBMLN5JK0w3nWiK_hkMzv8&usqp=CAU")
# terrassedelile.photo.attach(io: file, filename: "terrassedelile.jpg", content_type: "image/jpg")
# terrassedelile.save

# bambamcafe = Venue.create!(name: 'Bam Bam Café', address: '25 Rue Adolphe Moitié, Nantes', confirmed: true)
# file = URI.open("https://bambamcafe.fr/wp-content/uploads/2020/10/logo-pictographique-198x300.png")
# bambamcafe.photo.attach(io: file, filename: "bambamcafe.jpg", content_type: "image/jpg")
# bambamcafe.save

# belledejour = Venue.create!(name: 'Belle de jour', address: "4 Place du 51e Régiment d'artillerie, Nantes", confirmed: true)
# file = URI.open("https://www.belledejour.org/wp-content/uploads/2019/Identite/2019_07_11_page_attente_logo.svg")
# belledejour.photo.attach(io: file, filename: "belledejour.jpg", content_type: "image/jpg")
# belledejour.save

# chatnoir = Venue.create!(name: 'Chat noir', address: '13, allée Duguay-TROUIN, Nantes', confirmed: true)
# file = URI.open("https://fastly.4sqi.net/img/general/600x600/23980543_G7NbQbPs5niZPfH0LYmq8jzlMfBQaLVjXYdzuxki49Q.jpg")
# chatnoir.photo.attach(io: file, filename: "chatnoir.jpg", content_type: "image/jpg")
# chatnoir.save

# rondpointcafe = Venue.create!(name: 'Rond Point Café', address: '21 Quai des Antilles, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/317080074_594326709359796_2120859661755075842_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_muTNgy-UJgAX8EngWN&_nc_ht=scontent-cdg2-1.xx&oh=00_AfC0PhfNBqCZg052gsQtLXnVYMVn38wFDzMLQOv6EHuq6A&oe=6396AAB0")
# rondpointcafe.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
# rondpointcafe.save

# lemojo = Venue.create!(name: 'Le Mojo', address: '79 rue Maréchal Joffre, Nantes', confirmed: true)
# file = URI.open("https://media.cylex-locale.fr/companies/1323/1973/images/-133008455-img7_420002_large.jpg")
# lemojo.photo.attach(io: file, filename: "lemojo.jpg", content_type: "image/jpg")
# lemojo.save

# droledebarge = Venue.create!(name: 'Drole de Barge', address: 'Quai de Malakoff, Nantes', confirmed: true)
# file = URI.open("https://uploads.lebonbon.fr/source/2018/nantes_2018/septembre_2018/drole-de-barge-nantes.jpg")
# droledebarge.photo.attach(io: file, filename: "droledebarge.jpg", content_type: "image/jpg")
# droledebarge.save

# leferrailleur = Venue.create!(name: 'Le ferrailleur', address: 'Quai des Antilles, Nantes', confirmed: true)
# file = URI.open("https://www.guitarpart.fr/wp-content/uploads/2020/10/Le_Ferrailleur_logo.jpg")
# leferrailleur.photo.attach(io: file, filename: "leferrailleur.jpg", content_type: "image/jpg")
# leferrailleur.save

# labouchedair = Venue.create!(name: "La bouche d'air", address: '9 Rue Basse Prte, Nantes', confirmed: true)
# file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/q7co1zsxdoa04fj78qgwpvadiowc.png")
# labouchedair.photo.attach(io: file, filename: "labouchedair.jpg", content_type: "image/jpg")
# labouchedair.save

# duchesse = Venue.create!(name: 'Duchesse', address: '87 Rue Maréchal Joffre, Nantes', confirmed: true)
# file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/gskh1hd7pey7popdnrn96f6288di")
# duchesse.photo.attach(io: file, filename: "duchesse.jpg", content_type: "image/jpg")
# duchesse.save

# laribouldingue = Venue.create!(name: 'La Ribouldingue', address: '33 rue de Verdun, Nantes', confirmed: true)
# file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/nnlfaioljfj8di653mwr")
# laribouldingue.photo.attach(io: file, filename: "laribouldingue.jpg", content_type: "image/jpg")
# laribouldingue.save

# dockyard = Venue.create!(name: 'Dock Yard', address: '21 Quai des Antilles, Nantes', confirmed: true)
# file = URI.open("https://cdn-az.allevents.in/events1/banners/c01a6bb51afee1ada2505bbb83b3124d8d5f664a37e4d0f95b1739a729db20b3-rimg-w960-h435-gmir.jpg?v=1663321291")
# dockyard.photo.attach(io: file, filename: "dockyard.jpg", content_type: "image/jpg")
# dockyard.save

# microcomedyclub = Venue.create!(name: 'Micro Comedy Club', address: '59 Quai de la Fosse, Nantes', confirmed: true)
# file = URI.open("https://d1k4bi32qf3nf2.cloudfront.net/place/2022/03/micro_comedy_club1_1647421998.jpg")
# microcomedyclub.photo.attach(io: file, filename: "microcomedyclub.jpg", content_type: "image/jpg")
# microcomedyclub.save

# brasdefer = Venue.create!(name: 'Le Bras de Fer', address: '20 boulevard de la prairie au Duc, Nantes', confirmed: true)
# file = URI.open("https://media.ouest-france.fr/v1/pictures/MjAxOTAzOTVjNTcyMWZlZDIwMWViZGZjNWE4ODIyNDllN2M4MmM?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=b805da111a74380bd598866d66e1f6095e5444ca7cc0f2403fc65d1d1133be55")
# brasdefer.photo.attach(io: file, filename: "brasdefer.jpg", content_type: "image/jpg")
# brasdefer.save

# ubik = Venue.create!(name: 'L\'Ubik', address: '43 rue Maréchal Joffre, Nantes', confirmed: true)
# # file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/306273379_3376381379263836_3740578043945716239_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=myTq-gn6yFkAX-JJBfR&_nc_ht=scontent-cdg2-1.xx&oh=00_AfCr7v1g5XtoCXOwSK_DALyuvga-fHwlIYQqaXtvGvk_DA&oe=6396F1E9")
# ubik.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
# ubik.save

# puts 'Venues done !'

puts 'Creating events...'

neige = Event.create!(
  venue_id: Venue.find_by(name: 'Le Zygo Bar').id,
  date: DateTime.new(2023, 3, 1, 21),
  name: 'Neige',
  confirmed: true
)
neige.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')

alee = Event.create!(
  venue_id: Venue.find_by(name: 'Le Zygo Bar').id,
  date: DateTime.new(2023, 3, 2, 21),
  name: 'Alee et Mourad Musset',
  confirmed: true
)
alee.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')

dirty = Event.create!(
  venue_id: Venue.find_by(name: 'Le Zygo Bar').id,
  date: DateTime.new(2023, 3, 2, 21),
  name: 'Dirty Dance Swing',
  confirmed: true
)
dirty.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')

royal_kopek = Event.create!(
  venue_id: Venue.find_by(name: 'Le Zygo Bar').id,
  date: DateTime.new(2023, 3, 4, 21),
  name: 'Royal Kopek',
  confirmed: true
)
royal_kopek.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')

captain_frog = Event.create!(
  venue_id: Venue.find_by(name: 'Le Zygo Bar').id,
  date: DateTime.new(2023, 3, 5, 21),
  name: 'Captain Frog',
  confirmed: true
)
captain_frog.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: 'microbw.png', content_type: 'image/png')

puts 'Events done !'
puts 'Creating tags...'

Tag.create!(event_id: neige.id, subcategory_id: Subcategory.find_by(name: 'Folk').id)
Tag.create!(event_id: alee.id, subcategory_id: Subcategory.find_by(name: 'Rap').id)
Tag.create!(event_id: dirty.id, subcategory_id: Subcategory.find_by(name: 'Electro').id)
Tag.create!(event_id: royal_kopek.id, subcategory_id: Subcategory.find_by(name: 'World').id)
Tag.create!(event_id: captain_frog.id, subcategory_id: Subcategory.find_by(name: 'Slam').id)

puts 'Tags done !'

puts 'Seeding done !'
