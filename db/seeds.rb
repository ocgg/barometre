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
karaoke = Subcategory.create!(name: 'Karaoké', category_id: cat_musique.id)
metal = Subcategory.create!(name: 'Métal', category_id: cat_musique.id)
# These ones are for theater
impro = Subcategory.create!(name: 'Impro', category_id: cat_theatre.id)
stand_up = Subcategory.create!(name: 'Stand-up', category_id: cat_theatre.id)
cabaret = Subcategory.create!(name: 'Cabaret', category_id: cat_theatre.id)
caatch = Subcategory.create!(name: 'Catch', category_id: cat_theatre.id)
match = Subcategory.create!(name: 'Match', category_id: cat_theatre.id)
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
jym = Venue.create!(name: 'Jym', address: '39 Quai de Versailles, Nantes')
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/310554118_522195616579796_3242283571048074414_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=F-LGPpdJ308AX_1U26J&_nc_ht=scontent-cdg2-1.xx&oh=00_AfBCfWEbrPyyTFCwRstUdjqUR93uISPFMxqrf7ukq7v2rg&oe=6393BD57")
jym.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
jym.save

cafe_rouge_mecanique = Venue.create!(name: 'Le Café Rouge Mécanique', address: '10 rue bon secours, Nantes')
file = URI.open("https://images.noveltys.fr/locations/914/medium/le-cafe-rouge-mecanique@nantes.jpg")
cafe_rouge_mecanique.photo.attach(io: file, filename: "cafe_rouge_mecanique.jpg", content_type: "image/jpg")
cafe_rouge_mecanique.save

poumpoumtchak = Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau Nantes')
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/has8cs5lv4rb5x53rnstdv9ge905.png")
poumpoumtchak.photo.attach(io: file, filename: "poumpoumtchak.jpg", content_type: "image/jpg")
poumpoumtchak.save

arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes')
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/301547313_507672221359437_1408504075618823013_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gRTZO7JRNnsAX-AQ10I&_nc_ht=scontent-cdt1-1.xx&oh=00_AfC5GJaKKuDeMm8FoJhDANJVnCT6q1SMC4wBjnj2fxDb5w&oe=6393C498")
arlette_cafe.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
arlette_cafe.save

decadanse = Venue.create!(name: 'Décadanse', address: '1 boulevard Henry Orrion, Nantes')
file = URI.open("https://metropole.nantes.fr/files/images/culture-patrimoine/decadanse800.jpg")
decadanse.photo.attach(io: file, filename: "decadanse.jpg", content_type: "image/jpg")
decadanse.save

zygobar = Venue.create!(name: 'Le Zygo Bar', address: '35, rue des Olivettes, Nantes')
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/278052498_443057904286788_6465927659910487482_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2tq_QI_DUCgAX8cvcF-&tn=VTjhqTISxxN1y_Lw&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDqIIYrExBAQfA2DJjsND3Zf6VJkXvV7Ly8Wp9NaggpxA&oe=6392B981")
zygobar.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
zygobar.save

hopopop = Venue.create!(name: 'Hopopop Café', address: '6 allée du Port Maillard, Nantes')
file = URI.open("https://www.unidivers.fr/wp-content/uploads/2022/11/hopopop-nantes-2022-vendredi-25-novembre-21h00-2022-11-25t2100000100.jpg")
hopopop.photo.attach(io: file, filename: "hopopop.jpg", content_type: "image/jpg")
hopopop.save

atelierdudahu = Venue.create!(name: 'Atelier du Dahu', address: '26 Bd de Chantenay, Nantes')
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/311643157_101876086050201_5338119424858272314_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_Pcnb7dDxGAAX-b08Oi&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAXx66GoFNI-q-YgAc_eMdJaZ4dDRbsvao3MlQu0R1tCA&oe=6395AB88")
atelierdudahu.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
atelierdudahu.save

wattignies = Venue.create!(name: 'Wattignies', address: '13 Boulevard des Martyrs Nantais de la Résistance, Nantes')
file = URI.open("https://www.iledenantes.com/wp-content/uploads/2021/05/wattignies_2-848x301.png")
wattignies.photo.attach(io: file, filename: "wattignies.jpg", content_type: "image/jpg")
wattignies.save

livebar = Venue.create!(name: 'Live Bar', address: '7 rue des Etats, Nantes')
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/xdbh6k1zwrhcu1zc2lfbuzmqcoga.png")
livebar.photo.attach(io: file, filename: "livebar.jpg", content_type: "image/jpg")
livebar.save

mononcle = Venue.create!(name: 'Mon Oncle', address: '16 rue d\'Alger, Nantes, France')
file = URI.open("https://lestransbordeurs.com/blog/wp-content/uploads/2016/11/Mon-Oncle-rue-Alger.png")
mononcle.photo.attach(io: file, filename: "mononcle.jpg", content_type: "image/jpg")
mononcle.save

terrassedelile = Venue.create!(name: 'Terrasse de l\'ile', address: '21 quai des Antilles, Nantes')
file = URI.open("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUXUPglKogCFG5YtanC5ywYbDqLwDkFZpB6nDBswP8l7_i-vBMLN5JK0w3nWiK_hkMzv8&usqp=CAU")
terrassedelile.photo.attach(io: file, filename: "terrassedelile.jpg", content_type: "image/jpg")
terrassedelile.save

bambamcafe = Venue.create!(name: 'Bam Bam Café', address: '25 Rue Adolphe Moitié, Nantes')
file = URI.open("https://bambamcafe.fr/wp-content/uploads/2020/10/logo-pictographique-198x300.png")
bambamcafe.photo.attach(io: file, filename: "bambamcafe.jpg", content_type: "image/jpg")
bambamcafe.save

belledejour = Venue.create!(name: 'Belle de jour', address: "4 Place du 51e Régiment d'artillerie, Nantes")
file = URI.open("https://www.belledejour.org/wp-content/uploads/2019/Identite/2019_07_11_page_attente_logo.svg")
belledejour.photo.attach(io: file, filename: "belledejour.jpg", content_type: "image/jpg")
belledejour.save

chatnoir = Venue.create!(name: 'Chat noir', address: '13, allée Duguay-TROUIN, Nantes')
file = URI.open("https://fastly.4sqi.net/img/general/600x600/23980543_G7NbQbPs5niZPfH0LYmq8jzlMfBQaLVjXYdzuxki49Q.jpg")
chatnoir.photo.attach(io: file, filename: "chatnoir.jpg", content_type: "image/jpg")
chatnoir.save

rondpointcafe = Venue.create!(name: 'Rond Point Café', address: '21 Quai des Antilles, Nantes')
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/317080074_594326709359796_2120859661755075842_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_muTNgy-UJgAX8EngWN&_nc_ht=scontent-cdg2-1.xx&oh=00_AfC0PhfNBqCZg052gsQtLXnVYMVn38wFDzMLQOv6EHuq6A&oe=6396AAB0")
rondpointcafe.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
rondpointcafe.save

lemojo = Venue.create!(name: 'Le Mojo', address: '79 rue Maréchal Joffre, Nantes')
file = URI.open("https://media.cylex-locale.fr/companies/1323/1973/images/-133008455-img7_420002_large.jpg")
lemojo.photo.attach(io: file, filename: "lemojo.jpg", content_type: "image/jpg")
lemojo.save

droledebarge = Venue.create!(name: 'Drole de Barge', address: 'Quai de Malakoff, Nantes')
file = URI.open("https://uploads.lebonbon.fr/source/2018/nantes_2018/septembre_2018/drole-de-barge-nantes.jpg")
droledebarge.photo.attach(io: file, filename: "droledebarge.jpg", content_type: "image/jpg")
droledebarge.save

leferrailleur = Venue.create!(name: 'Le ferrailleur', address: 'Quai des Antilles, Nantes')
file = URI.open("https://www.guitarpart.fr/wp-content/uploads/2020/10/Le_Ferrailleur_logo.jpg")
leferrailleur.photo.attach(io: file, filename: "leferrailleur.jpg", content_type: "image/jpg")
leferrailleur.save

labouchedair = Venue.create!(name: "La bouche d'air", address: '9 Rue Basse Prte, Nantes')
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/q_auto:eco/q7co1zsxdoa04fj78qgwpvadiowc.png")
labouchedair.photo.attach(io: file, filename: "labouchedair.jpg", content_type: "image/jpg")
labouchedair.save

duchesse = Venue.create!(name: 'Duchesse', address: '87 Rue Maréchal Joffre, Nantes')
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/gskh1hd7pey7popdnrn96f6288di")
duchesse.photo.attach(io: file, filename: "duchesse.jpg", content_type: "image/jpg")
duchesse.save

laribouldingue = Venue.create!(name: 'La Ribouldingue', address: '33 rue de Verdun, Nantes')
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/nnlfaioljfj8di653mwr")
laribouldingue.photo.attach(io: file, filename: "laribouldingue.jpg", content_type: "image/jpg")
laribouldingue.save

dockyard = Venue.create!(name: 'Dock Yard', address: '21 Quai des Antilles, Nantes')
file = URI.open("https://cdn-az.allevents.in/events1/banners/c01a6bb51afee1ada2505bbb83b3124d8d5f664a37e4d0f95b1739a729db20b3-rimg-w960-h435-gmir.jpg?v=1663321291")
dockyard.photo.attach(io: file, filename: "dockyard.jpg", content_type: "image/jpg")
dockyard.save

microcomedyclub = Venue.create!(name: 'Micro Comedy Club', address: '59 Quai de la Fosse, Nantes')
file = URI.open("https://d1k4bi32qf3nf2.cloudfront.net/place/2022/03/micro_comedy_club1_1647421998.jpg")
microcomedyclub.photo.attach(io: file, filename: "microcomedyclub.jpg", content_type: "image/jpg")
microcomedyclub.save

brasdefer = Venue.create!(name: 'Le Bras de Fer', address: '20 boulevard de la prairie au Duc, Nantes')
file = URI.open("https://media.ouest-france.fr/v1/pictures/MjAxOTAzOTVjNTcyMWZlZDIwMWViZGZjNWE4ODIyNDllN2M4MmM?width=1260&height=708&focuspoint=50%2C25&cropresize=1&client_id=bpeditorial&sign=b805da111a74380bd598866d66e1f6095e5444ca7cc0f2403fc65d1d1133be55")
brasdefer.photo.attach(io: file, filename: "brasdefer.jpg", content_type: "image/jpg")
brasdefer.save

ubik = Venue.create!(name: 'L\'Ubik', address: '43 rue Maréchal Joffre, Nantes')
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/306273379_3376381379263836_3740578043945716239_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=myTq-gn6yFkAX-JJBfR&_nc_ht=scontent-cdg2-1.xx&oh=00_AfCr7v1g5XtoCXOwSK_DALyuvga-fHwlIYQqaXtvGvk_DA&oe=6396F1E9")
ubik.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
ubik.save

puts 'Venues done !'

puts 'Creating events...'

moustache_georges = Event.create!(
  venue_id: cafe_rouge_mecanique.id,
  date: DateTime.new(2023, 1, 19, 21),
  name: 'Sous la Moustache de Georges au Rouge Mécanique !',
  description: "Sous la Moustache de Georges revient au Rouge Mécanique pour explorer le répertoire intemporel de Brassens en compagnie de Margot, Fernande et les autres...",
  confirmed: true
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/316129645_794836428421908_4500654684748643179_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=340051&_nc_ohc=NZB2i8kpYrcAX8LZ7wE&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCPdUlt_PP-NSIxgOfl5F09M7j0660fgbSGBnxtp4Nveg&oe=6392F5C7")
moustache_georges.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
moustache_georges.save

fasme = Event.create!(
  venue_id: decadanse.id,
  date: DateTime.new(2023, 2, 3, 21),
  name: 'Fasme en live',
  description: "Le Nantais à l'énergie débordante nous fera voyager avec sa musique en constante évolution, entre electro, acid, braindance et synth-wave, et une mélodie subtile et mélancolique. Première partie TBA. Billetterie ouverte ! Quantité de billets limitée = réservation conseillée.",
  confirmed: true
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/317829102_2333815240120939_4559325730787944032_n.jpg?stp=dst-jpg_p960x960&_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=_QZ-9JyRa44AX8fJt1E&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAN4NK3KTuqxAVpdyOOFi_6uXzT7cisAoUltTXtKMOrCQ&oe=63936C88")
fasme.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
fasme.save

impro_hopopop = Event.create!(
  venue_id: hopopop.id,
  date: DateTime.new(2023, 1, 18, 20),
  name: "Théatre d'improvisation au Hopopop Café",
  description: "Seule l’envie de s’amuser compte pour monter sur scène ! Le 18 Janvier, le Hopopop café organise une scène ouverte accessible à toutes et tous, improvisateurs et improvisatrices d’un jour ou de toujours !",
  confirmed: true
)
file = URI.open("https://img.restaurantguru.com/r7b8-HoPoPop-Cafe-logo.jpg")
impro_hopopop.photo.attach(io: file, filename: "impro_hopopop.jpg", content_type: "image/jpg")
impro_hopopop.save

livebar_standup_deux = Event.create!(
  venue_id: livebar.id,
  date: DateTime.new(2023, 1, 3, 20),
  name: 'Live blagues',
  description: "Une heure de blagues, 4 humoristes pour que tu passes la meilleure soirée du mois avec ta bande de potes.",
  confirmed: true
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/312022693_183974587478686_1055600441062557149_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=EUdOXiS_S8gAX9A9Qg7&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAi0dJahrh47IqQ-k62KhLlgNr2xUzefwbZ_jusiIfeAw&oe=6397B1C9")
livebar_standup_deux.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
livebar_standup_deux.save

mononcle_standup = Event.create!(
  venue_id: mononcle.id,
  date: DateTime.new(2023, 1, 2, 19, 30),
  name: 'STAND UP NANTAIS',
  description: "Du stand up au Bar Mon oncle! Pendant 1h , 4 humoristes feront un spectacle rythmé ou les rires s'enchaineront autour d'un verre!",
  confirmed: true
)
file = URI.open("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F385358619%2F979245971293%2F1%2Foriginal.20221102-123157?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C120%2C590%2C295&s=d0c328e88398e05350fbe8abd5fb64b1")
mononcle_standup.photo.attach(io: file, filename: "mononcle_standup.jpg", content_type: "image/jpg")
mononcle_standup.save

puts 'Events done !'

karaoke_ribouldingue = Event.create!(
  venue_id: laribouldingue.id,
  date: DateTime.new(2022, 12, 21, 21),
  name: "Soirée Karaoké @la Ribouldingue",
  description: "Soirée Karaoké avec 32 000 titres au choix !! Venez pousser la chansonnette seul ou à plusieurs.",
  confirmed: true
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/309468202_597912441864154_8070331872516526149_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=mnL2qeJnBLAAX_crd1J&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDwCR5lZXcq4DKeBsZgZK_DwfymCRZf1F75p5Bn-d2sDw&oe=6397AEAA")
karaoke_ribouldingue.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
karaoke_ribouldingue.save
Tag.create!(event_id: karaoke_ribouldingue.id, subcategory_id: karaoke.id)
Tag.create!(event_id: karaoke_ribouldingue.id, subcategory_id: chanson.id)

watticatch2 = Event.create!(
  venue_id: wattignies.id,
  date: DateTime.new(2023, 1, 16, 20),
  name: "Watti'catch #3",
  description: "Catch d'improvisation théâtrale par la compagnie CITO !",
  confirmed: true
)
file = URI.open("https://cdn-az.allevents.in/events5/banners/6edefcc1af6520d745ae9af2b1a8b25f9cc02e09966f73b5c64b297a4d6137b7-rimg-w960-h356-gmir.jpg?v=1669584405")
watticatch2.photo.attach(io: file, filename: "watticatch.jpg", content_type: "image/jpg")
watticatch2.save
Tag.create!(event_id: watticatch2.id, subcategory_id: impro.id)
Tag.create!(event_id: watticatch2.id, subcategory_id: caatch.id)

watticatch3 = Event.create!(
  venue_id: wattignies.id,
  date: DateTime.new(2023, 2, 13, 20),
  name: "Watti'catch #4",
  description: "Catch d'improvisation théâtrale par la compagnie CITO !",
  confirmed: true
)
file = URI.open("https://cdn-az.allevents.in/events10/banners/7bafa337670f810e33568be81c8408c815d1e76757f6551e00d6904d0721f7ef-rimg-w960-h356-gmir.jpg?v=1669584425")
watticatch3.photo.attach(io: file, filename: "watticatch.jpg", content_type: "image/jpg")
watticatch3.save
Tag.create!(event_id: watticatch3.id, subcategory_id: impro.id)
Tag.create!(event_id: watticatch3.id, subcategory_id: caatch.id)

westsidecomedy2 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2022, 12, 21, 20, 30),
  name: "WEST SIDE COMEDY CLUB",
  description: "LA soirée mythique du Stand-up à la Nantaise est de retour tous les MERCREDIS ! 🎤
  Venez profiter d'une ambiance unique dans un des lieux les plus cool de Nantes 🏴‍☠️🏴‍☠️🏴‍☠️.
  Entrée sur consommation🍻
  Sortie au Chapeau pour les artistes !🎩
  au Dock Yard, 21 quai des Antilles, dernier bar du Hangar à Bananes 🔥",
  confirmed: true
)
file = URI.open("https://agendaculturel.emstorage.fr/west-side-comedy-club-20190730103723.jpg")
westsidecomedy2.photo.attach(io: file, filename: "westsidecomedy2.jpg", content_type: "image/jpg")
westsidecomedy2.save
Tag.create!(event_id: westsidecomedy2.id, subcategory_id: stand_up.id)

micro_comedy_club3 = Event.create!(
  venue_id: microcomedyclub.id,
  date: DateTime.new(2023, 1, 7, 18),
  name: "Micro Comedy Club",
  description: "Venez découvrir le premier bar dédié au Stand-Up de Nantes !
  Pour se marrer autour d'un verre et passer une soirée avec les meilleurs humoristes Nantais.
  Tous les samedis, retrouvez 4 humoristes sur scène pour plus d'une heure de spectacle !
  🕰 Spectacles à 18H 00 - 19H 30 & 21H 00
  Tarif : 10€",
  confirmed: true
)
file = URI.open("https://www.microcomedyclub.fr/wp-content/uploads/2022/05/4H-DJ-1024x576.png")
micro_comedy_club3.photo.attach(io: file, filename: "micro_comedy_club.jpg", content_type: "image/jpg")
micro_comedy_club3.save
Tag.create!(event_id: micro_comedy_club3.id, subcategory_id: stand_up.id)

micro_comedy_club4 = Event.create!(
  venue_id: microcomedyclub.id,
  date: DateTime.new(2023, 1, 14, 18),
  name: "Micro Comedy Club",
  description: "Venez découvrir le premier bar dédié au Stand-Up de Nantes !
  Pour se marrer autour d'un verre et passer une soirée avec les meilleurs humoristes Nantais.
  Tous les samedis, retrouvez 4 humoristes sur scène pour plus d'une heure de spectacle !
  🕰 Spectacles à 18H 00 - 19H 30 & 21H 00
  Tarif : 10€",
  confirmed: true
)
file = URI.open("https://www.microcomedyclub.fr/wp-content/uploads/2022/05/4H-DJ-1024x576.png")
micro_comedy_club4.photo.attach(io: file, filename: "micro_comedy_club.jpg", content_type: "image/jpg")
micro_comedy_club4.save
Tag.create!(event_id: micro_comedy_club4.id, subcategory_id: stand_up.id)

malin_cab_brasdefer = Event.create!(
  venue_id: brasdefer.id,
  date: DateTime.new(2022, 12, 21, 20),
  name: "La Troupe du Malin @ Bras de Fer",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !",
  confirmed: true
)
# file = URI.open("https://cdn-az.allevents.in/events1/banners/1cd89b1b615f3c5ea9dcb69266f2099927dac74352ca1f423742622d33a111c5-rimg-w526-h296-gmir.jpg?v=1647222839")
malin_cab_brasdefer.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
malin_cab_brasdefer.save
Tag.create!(event_id: malin_cab_brasdefer.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_brasdefer.id, subcategory_id: cabaret.id)

malin_cab_droledebarge = Event.create!(
  venue_id: droledebarge.id,
  date: DateTime.new(2023, 1, 4, 20),
  name: "La Troupe du Malin @Drôle de barge",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !",
  confirmed: true
)
# file = URI.open("https://cdn-az.allevents.in/events4/banners/97fecc45c2bbc73fb8fd24ed1494681a7b9a369926557b1e157e9dd42ce02a57-rimg-w960-h540-gmir.jpg?v=1669715404")
malin_cab_droledebarge.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
malin_cab_droledebarge.save
Tag.create!(event_id: malin_cab_droledebarge.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_droledebarge.id, subcategory_id: cabaret.id)

malin_cab_brasdefer2 = Event.create!(
  venue_id: brasdefer.id,
  date: DateTime.new(2023, 1, 18, 20),
  name: "La Troupe du Malin @ Bras de Fer",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !",
  confirmed: true
)
# file = URI.open("https://cdn-az.allevents.in/events1/banners/1cd89b1b615f3c5ea9dcb69266f2099927dac74352ca1f423742622d33a111c5-rimg-w526-h296-gmir.jpg?v=1647222839")
malin_cab_brasdefer2.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
malin_cab_brasdefer2.save
Tag.create!(event_id: malin_cab_brasdefer2.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_brasdefer2.id, subcategory_id: cabaret.id)

malin_cab_droledebarge2 = Event.create!(
  venue_id: droledebarge.id,
  date: DateTime.new(2023, 2, 1, 20),
  name: "La Troupe du Malin @Drôle de barge",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !",
  confirmed: true
)
# file = URI.open("https://cdn-az.allevents.in/events4/banners/97fecc45c2bbc73fb8fd24ed1494681a7b9a369926557b1e157e9dd42ce02a57-rimg-w960-h540-gmir.jpg?v=1669715404")
malin_cab_droledebarge2.photo.attach(io: File.open('app/assets/images/microbw.png'), filename: "microbw.png", content_type: "image/png")
malin_cab_droledebarge2.save
Tag.create!(event_id: malin_cab_droledebarge2.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_droledebarge2.id, subcategory_id: cabaret.id)

lutins_cab_dockyard = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 1, 3, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !",
  confirmed: true
)
file = URI.open("https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/evenement/scene/publication_facebook_-_lutins_givres_-_dock_yard2_-_1200x900.jpeg?itok=COCtkvSF")
lutins_cab_dockyard.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard.save
Tag.create!(event_id: lutins_cab_dockyard.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard.id, subcategory_id: cabaret.id)

lutins_cab_dockyard2 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 2, 7, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !",
  confirmed: true
)
file = URI.open("https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/evenement/scene/publication_facebook_-_lutins_givres_-_dock_yard2_-_1200x900.jpeg?itok=COCtkvSF")
lutins_cab_dockyard2.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard2.save
Tag.create!(event_id: lutins_cab_dockyard2.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard2.id, subcategory_id: cabaret.id)

lutins_cab_dockyard3 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 3, 7, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !",
  confirmed: true
)
file = URI.open("https://www.wik-nantes.fr/sites/default/files/styles/img_principale_contenu_interne/public/evenement/scene/publication_facebook_-_lutins_givres_-_dock_yard2_-_1200x900.jpeg?itok=COCtkvSF")
lutins_cab_dockyard3.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard3.save
Tag.create!(event_id: lutins_cab_dockyard3.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard3.id, subcategory_id: cabaret.id)

lutins_cab_ubik = Event.create!(
  venue_id: ubik.id,
  date: DateTime.new(2023, 1, 17, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @L'Ubik !",
  confirmed: true
)
file = URI.open("https://agendaculturel.emstorage.fr/le-cabaret-des-lutins-a-l-ubik-20221025165708.jpg")
lutins_cab_ubik.photo.attach(io: file, filename: "lutins_cab_ubik.jpg", content_type: "image/jpg")
lutins_cab_ubik.save
Tag.create!(event_id: lutins_cab_ubik.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_ubik.id, subcategory_id: cabaret.id)

lutins_cab_ubik2 = Event.create!(
  venue_id: ubik.id,
  date: DateTime.new(2023, 2, 21, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @L'Ubik !",
  confirmed: true
)
file = URI.open("https://agendaculturel.emstorage.fr/le-cabaret-des-lutins-a-l-ubik-20221025165708.jpg")
lutins_cab_ubik2.photo.attach(io: file, filename: "lutins_cab_ubik2.jpg", content_type: "image/jpg")
lutins_cab_ubik2.save
Tag.create!(event_id: lutins_cab_ubik2.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_ubik2.id, subcategory_id: cabaret.id)

puts 'Creating tags...'

Tag.create!(event_id: moustache_georges.id, subcategory_id: concert.id)
Tag.create!(event_id: moustache_georges.id, subcategory_id: chanson.id)
Tag.create!(event_id: fasme.id, subcategory_id: electro.id)
Tag.create!(event_id: fasme.id, subcategory_id: dj_set.id)
Tag.create!(event_id: impro_hopopop.id, subcategory_id: impro.id)

Tag.create!(event_id: livebar_standup_deux.id, subcategory_id: stand_up.id)
Tag.create!(event_id: mononcle_standup.id, subcategory_id: stand_up.id)

puts 'Tags done !'

puts 'Seeding done !'
