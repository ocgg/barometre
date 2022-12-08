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
caatch = Subcategory.create!(name: 'Catch', category_id: cat_theatre.id)
match = Subcategory.create!(name: 'Match', category_id: cat_theatre.id)
puts 'Subcategories done !'

puts 'Creating venues...'
# These are real bars
jym = Venue.create!(name: 'Jym', address: '39 Quai de Versailles, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/310554118_522195616579796_3242283571048074414_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=F-LGPpdJ308AX_1U26J&_nc_ht=scontent-cdg2-1.xx&oh=00_AfBCfWEbrPyyTFCwRstUdjqUR93uISPFMxqrf7ukq7v2rg&oe=6393BD57")
jym.photo.attach(io: file, filename: "jym.jpg", content_type: "image/jpg")
jym.save

cafe_rouge_mecanique = Venue.create!(name: 'Le Café Rouge Mécanique', address: '10 rue bon secours, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/306269728_516294783832142_8794255962981862975_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uSgaAZfNfQQAX8N5JAj&_nc_oc=AQkjJibkhdl70LtIfcEsk0y2JLCITRYg7N0BzWLDM-x9ZCDzKoFNGrv7LmwTELZbtgbyW0IVxTxcY1n1_czouYDr&_nc_ht=scontent-cdt1-1.xx&oh=00_AfC_Q4judFPKH4qXF49OFc5vHNJDcD-pzxtUOap3Mn7KiQ&oe=63928749")
cafe_rouge_mecanique.photo.attach(io: file, filename: "cafe_rouge_mecanique.jpg", content_type: "image/jpg")
cafe_rouge_mecanique.save

poumpoumtchak = Venue.create!(name: "Poum Poum T'chak", address: '19 rue du Chateau Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/292208531_468171625310814_1119501534627500364_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=HJYETykV7yoAX_2kylv&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDNOHJJQyBXip38pRJHYT-nYdOQ2KcPfvCjWPiQ78yMZg&oe=63938B55")
poumpoumtchak.photo.attach(io: file, filename: "poumpoumtchak.jpg", content_type: "image/jpg")
poumpoumtchak.save

arlette_cafe = Venue.create!(name: 'Arlette Café', address: '12, boulevard de la Prairie au Duc, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/301547313_507672221359437_1408504075618823013_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gRTZO7JRNnsAX-AQ10I&_nc_ht=scontent-cdt1-1.xx&oh=00_AfC5GJaKKuDeMm8FoJhDANJVnCT6q1SMC4wBjnj2fxDb5w&oe=6393C498")
arlette_cafe.photo.attach(io: file, filename: "arlette_cafe.jpg", content_type: "image/jpg")
arlette_cafe.save

decadanse = Venue.create!(name: 'Décadanse', address: '1 boulevard Henry Orrion, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/296110303_118627437580104_9046599361537357047_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=N2jkk6vGOmAAX-GAS04&_nc_ht=scontent-cdg2-1.xx&oh=00_AfCrqNtDSAGD3e7TnoeKHs8hK6RkOYabQVd5V5h99OVKbQ&oe=6392140F")
decadanse.photo.attach(io: file, filename: "decadanse.jpg", content_type: "image/jpg")
decadanse.save

zygobar = Venue.create!(name: 'Le Zygo Bar', address: '35, rue des Olivettes, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/278052498_443057904286788_6465927659910487482_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=2tq_QI_DUCgAX8cvcF-&tn=VTjhqTISxxN1y_Lw&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDqIIYrExBAQfA2DJjsND3Zf6VJkXvV7Ly8Wp9NaggpxA&oe=6392B981")
zygobar.photo.attach(io: file, filename: "zygobar.jpg", content_type: "image/jpg")
zygobar.save

hopopop = Venue.create!(name: 'Hopopop Café', address: '6 allée du Port Maillard, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/304795071_499426338853508_480459198731371046_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=O1nrTdWQDaYAX_0SKkt&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBxr6e37-9S4IkUIuPCI5c43_SWCPEWVH5m8_QaxWC60A&oe=63932B5B")
hopopop.photo.attach(io: file, filename: "hopopop.jpg", content_type: "image/jpg")
hopopop.save

atelierdudahu = Venue.create!(name: 'Atelier du Dahu', address: '26 Bd de Chantenay, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/311643157_101876086050201_5338119424858272314_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_Pcnb7dDxGAAX-b08Oi&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAXx66GoFNI-q-YgAc_eMdJaZ4dDRbsvao3MlQu0R1tCA&oe=6395AB88")
atelierdudahu.photo.attach(io: file, filename: "atelierdudahu.jpg", content_type: "image/jpg")
atelierdudahu.save

wattignies = Venue.create!(name: 'Wattignies', address: '13 Boulevard des Martyrs Nantais de la Résistance, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/246380841_420878412989692_8212226121883495537_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=174925&_nc_ohc=AAJRI9z7rK0AX9cqFqu&_nc_ht=scontent-cdg2-1.xx&oh=00_AfBcgqaFfKlUUA1g7EAaPvG4BxZ13YkPf-dUTYSvt62w3Q&oe=63977FCE")
wattignies.photo.attach(io: file, filename: "wattignies.jpg", content_type: "image/jpg")
wattignies.save

livebar = Venue.create!(name: 'Live Bar', address: '7 rue des Etats, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/241687426_3034912980088402_8939573095537068548_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=ELeV_gbxLHoAX8RqjGp&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCp6w4e7XrchiY1xY9hC233YtekLAI6bd9T0AcWrQDDJw&oe=63960AFF")
livebar.photo.attach(io: file, filename: "livebar.jpg", content_type: "image/jpg")
livebar.save

mononcle = Venue.create!(name: 'Mon Oncle', address: '16 rue d\'Alger, Nantes, France')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/295140659_456322713168932_2191338253379941258_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1SrLnr-KLWkAX_wPFrV&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCiZLaiSKAeZmy1lSbLCCv4rTOvT2MQtIHYKXld4exadw&oe=63965EEA")
mononcle.photo.attach(io: file, filename: "mononcle.jpg", content_type: "image/jpg")
mononcle.save

terrassedelile = Venue.create!(name: 'Terrasse de l\'ile', address: '21 quai des Antilles, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/295140659_456322713168932_2191338253379941258_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1SrLnr-KLWkAX_wPFrV&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCiZLaiSKAeZmy1lSbLCCv4rTOvT2MQtIHYKXld4exadw&oe=63965EEA")
terrassedelile.photo.attach(io: file, filename: "terrassedelile.jpg", content_type: "image/jpg")
terrassedelile.save

bambamcafe = Venue.create!(name: 'Bam Bam Café', address: '25 Rue Adolphe Moitié, Nantes')
file = URI.open("https://bambamcafe.fr/wp-content/uploads/2020/10/logo-pictographique.png")
bambamcafe.photo.attach(io: file, filename: "bambamcafe.jpg", content_type: "image/jpg")
bambamcafe.save

belledejour = Venue.create!(name: 'Belle de jour', address: "4 Place du 51e Régiment d'artillerie, Nantes")
file = URI.open("https://www.belledejour.org/wp-content/uploads/2019/Identite/2019_07_11_page_attente_logo.svg")
belledejour.photo.attach(io: file, filename: "belledejour.jpg", content_type: "image/jpg")
belledejour.save

chatnoir = Venue.create!(name: 'Chat noir', address: '13, allée Duguay-TROUIN, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/308195305_456690543167335_2305163446639246722_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=XlYHAReBD9AAX8R5aHb&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAuSPr4Ez77n8YEQXLbTbht_lfa8ncKo7MDwU4a6ThvXg&oe=6397370B")
chatnoir.photo.attach(io: file, filename: "chatnoir.jpg", content_type: "image/jpg")
chatnoir.save

rondpointcafe = Venue.create!(name: 'Rond Point Café', address: '21 Quai des Antilles, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/317080074_594326709359796_2120859661755075842_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=_muTNgy-UJgAX8EngWN&_nc_ht=scontent-cdg2-1.xx&oh=00_AfC0PhfNBqCZg052gsQtLXnVYMVn38wFDzMLQOv6EHuq6A&oe=6396AAB0")
rondpointcafe.photo.attach(io: file, filename: "rondpointcafe.jpg", content_type: "image/jpg")
rondpointcafe.save

lemojo = Venue.create!(name: 'Le Mojo', address: '79 rue Maréchal Joffre, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/277760359_472262214515199_612204601442863833_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NbVtU6VD8z8AX_kqtVi&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAgkJG5_73ugg0sEQ33KWBOO5lKhPQ-VFU-ZknFJW8D4Q&oe=63971E8B")
lemojo.photo.attach(io: file, filename: "lemojo.jpg", content_type: "image/jpg")
lemojo.save

droledebarge = Venue.create!(name: 'Drole de Barge', address: 'Quai de Malakoff, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/273506367_3023762171211968_886927866622940658_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=dEuLupY5l0YAX_rSlnf&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAc-oF4vjQ8ZcnvyuJ-dodvRGnmn9Khj17g3pmWXDNksA&oe=6396923C")
droledebarge.photo.attach(io: file, filename: "droledebarge.jpg", content_type: "image/jpg")
droledebarge.save

leferrailleur = Venue.create!(name: 'Le ferrailleur', address: 'Quai des Antilles, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t1.18169-9/26230643_2270337162992066_7946261552522999814_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=uk8o-RU3FjwAX_J1gZf&_nc_ht=scontent-cdt1-1.xx&oh=00_AfD1G4DZtfaPfv0puStSSZCAhZwXDF2stcTsbC_6foMtEA&oe=63B92FAA")
leferrailleur.photo.attach(io: file, filename: "leferrailleur.jpg", content_type: "image/jpg")
leferrailleur.save

labouchedair = Venue.create!(name: "La bouche d'air", address: '9 Rue Basse Prte, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/291339674_10160132235999804_6375782965551734420_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=pxDfUxjFSg0AX8qNwh9&tn=Q4OYg86FdnfdCg53&_nc_ht=scontent-cdt1-1.xx&oh=00_AfB_Ichzvjq3b1N0qWCLc5OtXveEybYzU04K6mZTfIVO2w&oe=63978250")
labouchedair.photo.attach(io: file, filename: "labouchedair.jpg", content_type: "image/jpg")
labouchedair.save

duchesse = Venue.create!(name: 'Duchesse', address: '87 Rue Maréchal Joffre, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/292349348_492436182685046_767676553186516684_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=3mHfE8p6HRAAX8AAR9G&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAm6toMcP-puY4JASeABH6B6r9wsj1bEFBJyj47Krgu4A&oe=63968AF4")
duchesse.photo.attach(io: file, filename: "duchesse.jpg", content_type: "image/jpg")
duchesse.save

laribouldingue = Venue.create!(name: 'La Ribouldingue', address: '33 rue de Verdun, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t1.18169-9/579094_514574748637378_1165657525_n.png?_nc_cat=111&ccb=1-7&_nc_sid=174925&_nc_ohc=SQKYCOP6orUAX_eGpaV&_nc_ht=scontent-cdg2-1.xx&oh=00_AfA16a_hV2n5mVT7KhBq-b5PSFF_ik1WiOYjZW277Q-Y3w&oe=63B917FB")
laribouldingue.photo.attach(io: file, filename: "laribouldingue.jpg", content_type: "image/jpg")
laribouldingue.save

dockyard = Venue.create!(name: 'Dock Yard', address: '21 Quai des Antilles, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/299793364_493602512768781_8293957328715775303_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=mrm91_Qu38gAX92fldh&_nc_oc=AQnfw5UXBMLHmNA2bBvvwDa4p36-wdeaWh2W-NfrzxdEGpdFYBQ0k7KZ2eOw1zfR_5WpuOkoHLdOY3UJOIjVxgk2&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBKMKi73H95FFBFtohD3KKFtNXmPB6CxmqILclKife6gg&oe=63976D09")
dockyard.photo.attach(io: file, filename: "dockyard.jpg", content_type: "image/jpg")
dockyard.save

microcomedyclub = Venue.create!(name: 'Micro Comedy Club', address: '59 Quai de la Fosse, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/264097815_4020984804669738_6934094807923094012_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=JvTQmwQThpUAX9eu7wN&_nc_ht=scontent-cdg2-1.xx&oh=00_AfBOxRbk8KAs4V5bMqvtDOuT2Pz89x1fJecsncpnGvX7iA&oe=6395E765")
microcomedyclub.photo.attach(io: file, filename: "microcomedyclub.jpg", content_type: "image/jpg")
microcomedyclub.save

brasdefer = Venue.create!(name: 'Le Bras de Fer', address: '20 boulevard de la prairie au Duc, Nantes')
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/307113470_947496556192547_1694559614383633200_n.jpg?_nc_cat=105&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=SnfMsZQ6MxQAX90rtix&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAgrSKNC4tYKXVMtdWuC4Up9_e5NpI2urCDnTNBkHbSbw&oe=6395DBCA")
brasdefer.photo.attach(io: file, filename: "brasdefer.jpg", content_type: "image/jpg")
brasdefer.save

ubik = Venue.create!(name: 'L\'Ubik', address: '43 rue Maréchal Joffre, Nantes')
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/306273379_3376381379263836_3740578043945716239_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=myTq-gn6yFkAX-JJBfR&_nc_ht=scontent-cdg2-1.xx&oh=00_AfCr7v1g5XtoCXOwSK_DALyuvga-fHwlIYQqaXtvGvk_DA&oe=6396F1E9")
ubik.photo.attach(io: file, filename: "ubik.jpg", content_type: "image/jpg")
ubik.save

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
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/310554118_522195616579796_3242283571048074414_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NQYPL2LkltcAX-_IHMp&_nc_ht=scontent-cdg2-1.xx&oh=00_AfD3FvUHXFSoZvMQ_nAeHUtvgOvaVhvgKoPk42tg2CKUvQ&oe=6397B1D7")
jim_karaoke.photo.attach(io: file, filename: "jim_karaoke.jpg", content_type: "image/jpg")
jim_karaoke.save

blind_test_du_poum = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 9, 20),
  name: 'Blind Test du Poum',
  description: "Une petite soirée calme (ou pas) comme on les aimes. Venez participer au blind test du poum en famille ou entre amis!"
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/311899351_5502496649843615_2373007547358726341_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=340051&_nc_ohc=zXXLD5gFUwkAX84OnMh&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBa4vNY2qCcybOyiq1CDkM6_Foi9yaQuymIQu_4zvQB5g&oe=6391E81B")
# blind_test_du_poum.photo.attach(io: file, filename: "blind_test_du_poum.jpg", content_type: "image/jpg")
# blind_test_du_poum.save

la_44_deux_fievre = Event.create!(
  venue_id: poumpoumtchak.id,
  date: DateTime.new(2022, 12, 15, 21),
  name: 'La 44.2 Fièvre au Poum',
  description: "Dernier concert de l'année pour la 44.2 Fièvre !
  Une année bien remplie avec de nouveaux morceaux, de nouvelles acrobaties, plus de déhanché et encore plus d'ambiance !"
)
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/318304962_519718320197992_8034251445748193653_n.jpg?stp=dst-jpg_p960x960&_nc_cat=108&ccb=1-7&_nc_sid=340051&_nc_ohc=x1r4a9N5HZoAX_T9L2F&tn=VTjhqTISxxN1y_Lw&_nc_ht=scontent-cdg2-1.xx&oh=00_AfDWTin6ynCPWCyUaDx3yt5314nT3TbaanyT87dRCkVuXw&oe=6391F423")
# la_44_deux_fievre.photo.attach(io: file, filename: "la_44_deux_fievre.jpg", content_type: "image/jpg")
# la_44_deux_fievre.save

arlette_blind = Event.create!(
  venue_id: arlette_cafe.id,
  date: DateTime.new(2022, 12, 23, 20),
  name: 'BlindTest Années 2000',
  description: "Le BLINDTEST ANNÉES 2000 est de retour au Arlette. Retrouvez les musiques les plus mythiques d'une décennie marquée par des hits tous plus mémorables les uns que les autres !"
)
# file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/316427002_574927171300608_5774605556541412323_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=730e14&_nc_ohc=xXWKoEQB2vsAX9X2btG&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAPTkWV0lW9cyELfV8RMnzxPuXf414I8bsiRkUMymJSgQ&oe=6391DF5F")
# arlette_blind.photo.attach(io: file, filename: "arlette_blind.jpg", content_type: "image/jpg")
# arlette_blind.save

arlette_dj_chol = Event.create!(
  venue_id: arlette_cafe.id,
  date: DateTime.new(2022, 12, 8, 22),
  name: 'dj chol & jathieu',
  description: "Venez au Arlette café à partir de 21h pour kiffer sur les sons house/techno survitaminés de DJ CHOL & JATHIEU ! Places limitées !"
)
# file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/301547313_507672221359437_1408504075618823013_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=gRTZO7JRNnsAX-AQ10I&_nc_ht=scontent-cdt1-1.xx&oh=00_AfB50wxmCJEvvUAQssNqhdRUm7guAqRB6btnIy5BTp-eOA&oe=6391CA58")
# arlette_dj_chol.photo.attach(io: file, filename: "arlette_dj_chol.jpg", content_type: "image/jpg")
# arlette_dj_chol.save

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

sven_dahu = Event.create!(
  venue_id: atelierdudahu.id,
  date: DateTime.new(2022, 12, 10, 18),
  name: "TISDASS + Sven et sa musique modale",
  description: "Soirée concerts au dahu!
  Tisdass investit le DAHU samedi 10 décembre avec en première partie Sven et sa musique modale
  Au programme, musique modale et Rock Touareg
  Et comme d'hab, bière, vins et bonne humeur.
  Entrée a prix libre
  Pas de TPE donc prend du cash!"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/318213653_125365897036232_2509487187730267571_n.jpg?stp=dst-jpg_p960x960&_nc_cat=109&ccb=1-7&_nc_sid=340051&_nc_ohc=x0t7T0rReTUAX-m6kiq&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBL6jQ0Oq2qfIf82_74dHuIqk5s_2BMJJEOUBMsHIIj-g&oe=63968BF0")
sven_dahu.photo.attach(io: file, filename: "sven_dahu.jpg", content_type: "image/jpg")
sven_dahu.save

#seeds sewan events
livebar_standup = Event.create!(
  venue_id: livebar.id,
  date: DateTime.new(2022, 12, 14, 20),
  name: 'Live blagues',
  description: "Une heure de blagues, 4 humoristes pour que tu passes la meilleure soirée du mois avec ta bande de potes."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/312022693_183974587478686_1055600441062557149_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=EUdOXiS_S8gAX9A9Qg7&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAi0dJahrh47IqQ-k62KhLlgNr2xUzefwbZ_jusiIfeAw&oe=6397B1C9")
livebar_standup.photo.attach(io: file, filename: "livebar_standup.jpg", content_type: "image/jpg")
livebar_standup.save

livebar_standup_deux = Event.create!(
  venue_id: livebar.id,
  date: DateTime.new(2023, 1, 3, 20),
  name: 'Live blagues',
  description: "Une heure de blagues, 4 humoristes pour que tu passes la meilleure soirée du mois avec ta bande de potes."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/312022693_183974587478686_1055600441062557149_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=EUdOXiS_S8gAX9A9Qg7&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAi0dJahrh47IqQ-k62KhLlgNr2xUzefwbZ_jusiIfeAw&oe=6397B1C9")
livebar_standup_deux.photo.attach(io: file, filename: "livebar_standup_deux.jpg", content_type: "image/jpg")
livebar_standup_deux.save

mononcle_standup = Event.create!(
  venue_id: mononcle.id,
  date: DateTime.new(2023, 1, 2, 19, 30),
  name: 'STAND UP NANTAIS',
  description: "Du stand up au Bar Mon oncle! Pendant 1h , 4 humoristes feront un spectacle rythmé ou les rires s'enchaineront autour d'un verre!"
)
file = URI.open("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F385358619%2F979245971293%2F1%2Foriginal.20221102-123157?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C120%2C590%2C295&s=d0c328e88398e05350fbe8abd5fb64b1")
mononcle_standup.photo.attach(io: file, filename: "mononcle_standup.jpg", content_type: "image/jpg")
mononcle_standup.save

terrassedelile_cabaretdimpro = Event.create!(
  venue_id: mononcle.id,
  date: DateTime.new(2022, 12, 14, 18),
  name: "Cabaret d'impro",
  description: "Le duo Remi et SamSam sera présent le 14 Décembre de 18h30 à 19h30 pour un Cabaret d'impro à la Terrasse de l'ile !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/295140659_456322713168932_2191338253379941258_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=1SrLnr-KLWkAX_wPFrV&_nc_ht=scontent-cdt1-1.xx&oh=00_AfCiZLaiSKAeZmy1lSbLCCv4rTOvT2MQtIHYKXld4exadw&oe=63965EEA")
terrassedelile_cabaretdimpro.photo.attach(io: file, filename: "terrassedelile_cabaretdimpro.jpg", content_type: "image/jpg")
terrassedelile_cabaretdimpro.save

bam_blagues = Event.create!(
  venue_id: bambamcafe.id,
  date: DateTime.new(2022, 12, 16, 20),
  name: 'Bam-Blagues',
  description: "Soirée Stand-up !
  Le Bam Bam Café s’improvise en Comedy-Club le temps d’une soirée.
  Le principe ? 5 humoristes viennent raconter leur semaine et partager les dernières blagues qu’ils ont trouvés. L’occasion de découvrir des stars du rire avant qu’elles le deviennent.
  1h de spectacle, chapeau pour les artistes à la sortie.
  Réservation (gratuite) conseillée !"
)
file = URI.open("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F403487089%2F133233472247%2F1%2Foriginal.20221202-002018?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C14%2C1200%2C600&s=3c3a0ec2c31ce541150c16362b3bf529")
bam_blagues.photo.attach(io: file, filename: "bam_blagues.jpg", content_type: "image/jpg")
bam_blagues.save

belledejour_lundi = Event.create!(
  venue_id: belledejour.id,
  date: DateTime.new(2022, 12, 12, 20),
  name: "DROLES DE LUNDIS",
  description: "DROLES DE LUNDIS c'est 6 artistes qui viendront vous faire rire avec leurs meilleures blagues dans un des lieu les plus cool de Nantes !"
)
file = URI.open("https://img.evbuc.com/https%3A%2F%2Fcdn.evbuc.com%2Fimages%2F405418129%2F208988335102%2F1%2Foriginal.20221206-084331?w=940&auto=format%2Ccompress&q=75&sharp=10&rect=0%2C0%2C1586%2C793&s=e815d53cbe1f37e42e0fe64027070f1b")
belledejour_lundi.photo.attach(io: file, filename: "belledejour_lundi.jpg", content_type: "image/jpg")
belledejour_lundi.save

chatnoir_scene_ouverte = Event.create!(
  venue_id: chatnoir.id,
  date: DateTime.new(2022, 12, 14, 20, 30),
  name: "SCENE OUVERTE MUSICALE",
  description: " Si vous souhaitez montrez vos talents de musicien rendez-vous au Chat Noir avec vos instruments pour une jam session. Sont mis à disposition des micros et une sono !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/300240197_5417355821664981_1191762389490463171_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=340051&_nc_ohc=TDhCIvKkr-AAX8Esrdc&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDPmyOLnNLTxQ4t7LjQNq71nuJGQ8uXu8Fz0Tvb55cB2A&oe=6396D641")
chatnoir_scene_ouverte.photo.attach(io: file, filename: "chatnoir_scene_ouverte.jpg", content_type: "image/jpg")
chatnoir_scene_ouverte.save

rondpointcafe_concert = Event.create!(
  venue_id: rondpointcafe.id,
  date: DateTime.new(2022, 12, 10, 22),
  name: 'Rythm Local ❈ C.H.I.C.H.I. & Alan.D',
  description: "RYTHM, La soirée 100% House Music du Rond Point à Nantes se poursuit le 10 décembre prochain"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/316408455_589290166530117_805756004358281945_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=340051&_nc_ohc=ag1tTSqvzDQAX8DLTtJ&_nc_ht=scontent-cdt1-1.xx&oh=00_AfB13eqS-HrcVpxpveUk6tDAUvrFeYwCqDveucrkOWxJAw&oe=6397175E")
rondpointcafe_concert.photo.attach(io: file, filename: "rondpointcafe_concert.jpg", content_type: "image/jpg")
rondpointcafe_concert.save

mojo_concert = Event.create!(
  venue_id: lemojo.id,
  date: DateTime.new(2022, 12, 9, 19),
  name: 'Cromearty - dj set',
  description: "On se retrouve au mojo le vendredi 9 décembre pour un dj set House de Cromearty "
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/277760359_472262214515199_612204601442863833_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=NbVtU6VD8z8AX_kqtVi&_nc_ht=scontent-cdt1-1.xx&oh=00_AfAgkJG5_73ugg0sEQ33KWBOO5lKhPQ-VFU-ZknFJW8D4Q&oe=63971E8B")
mojo_concert.photo.attach(io: file, filename: "mojo_concert.jpg", content_type: "image/jpg")
mojo_concert.save
# fin seeds sewan events
puts 'Events done !'

#seeds Julie################################################################################################################

abstrack_djs = Event.create!(
  venue_id: droledebarge.id,
  date: DateTime.new(2022, 12, 16, 21),
  name: "Abstrack Djs @Drole de Barge",
  description: "💥C'est le retour d'Abstrack à la Drôle de Barge!
  Artisans qualités de la fête libre, le collectif & label Abstrack débute une nouvelle Résidence !
  2 Djs Abstrack en B2B !"
)
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/xpsh22k5oo9jexx1c43813oze4kp")
abstrack_djs.photo.attach(io: file, filename: "abstrack_djs.jpg", content_type: "image/jpg")
abstrack_djs.save
Tag.create!(event_id: abstrack_djs.id, subcategory_id: dj_set.id)

karaoke_rock = Event.create!(
  venue_id: leferrailleur.id,
  date: DateTime.new(2022, 12, 10, 20, 30),
  name: "Karaoké Rock @Le Ferrailleur",
  description: "Rendez-vous samedi 10 décembre à 20h30 pour le Karaoké rock metal de Noël animé par la légende locale Manard. (Manoir pour les intimes) #gratuit
  Pour les petits nouveaux, voici tout ce qu'il faut savoir :
  - Plus de 3000 morceaux rock/metal/variété rock...
  - Une vraie scène, de vrais micros, du vrai son.
  - Une carte de bières locales idéales pour se motiver.
  - Un vrai animateur qui ne sait ni chanter, ni animer."
)
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/nnyw4qtxobrivw6ponpd1qwtopxo")
karaoke_rock.photo.attach(io: file, filename: "karaoke_rock.jpg", content_type: "image/jpg")
karaoke_rock.save
Tag.create!(event_id: karaoke_rock.id, subcategory_id: karaoke.id)
Tag.create!(event_id: karaoke_rock.id, subcategory_id: rock.id)

ohm_ferrailleur = Event.create!(
  venue_id: leferrailleur.id,
  date: DateTime.new(2022, 12, 16, 21),
  name: "[OHM] (Release Party) + DJIIN",
  description: "💥C'est le retour d'Abstrack à la Drôle de Barge!
  Artisans qualités de la fête libre, le collectif & label Abstrack débute une nouvelle Résidence !
  2 Djs Abstrack en B2B !"
)
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/k64f7ddad5cgb6nrj3gni3lhalqk")
ohm_ferrailleur.photo.attach(io: file, filename: "ohm_ferrailleur.jpg", content_type: "image/jpg")
ohm_ferrailleur.save
Tag.create!(event_id: ohm_ferrailleur.id, subcategory_id: concert.id)
Tag.create!(event_id: ohm_ferrailleur.id, subcategory_id: rock.id)

lowpkin_duchesse = Event.create!(
  venue_id: duchesse.id,
  date: DateTime.new(2022, 12, 15, 20),
  name: "LOWPKIN à la DUCHESSE ",
  description: "Concert - LOWPKIN à la DUCHESSE - Le Jeudi 15 decembre - 20H - PAF 5€ sur place !
  LOWPKIN est un nouveau projet né d'une collaboration entre 3 musiciens/producteurs (IDEM, Kyu, The Drift, El Barön
  Brissetti, Black Boiler) qui fait la part belle aux teintes musicales dans lesquelles ses membres ont forgé leurs cultures respectives :
  du psychélisme cinématographique au post punk, en passant par la new wave et la musique électronique allemande.
  On y retrouve l’abrasion du shoegaze et de la noise, les secousses sismiques du dub, le désespoir du post-rock,
  l’obstination du krautrock, le groove froid de la techno... Le trio y sonne comme un !!! qui aurait davantage écouté
  Killing Joke que Talking Heads, comme un WhoMadeWho qui rendrait hommage à PiL, ou des D.A.F. qui auraient fumé les
  cendre de King Tubby devant un film de John Carpenter.
  Ce projet artistique se veut répondre à une envie simple : faire danser le public.
  Lowpkin vous traîne au milieu de la piste sans vous demander votre avis, vous fait lever les bras et les yeux au ciel
  dans des incantations mystérieuses, vous donne la sensation d'être seul·e au monde au milieu d'une foule en pleine communion."
)
file = URI.open("https://res.cloudinary.com/dcyafbpoh/image/upload/xf4m8danxie2wc24hgngwk8zpkn3")
lowpkin_duchesse.photo.attach(io: file, filename: "lowpkin_duchesse.jpg", content_type: "image/jpg")
lowpkin_duchesse.save
Tag.create!(event_id: lowpkin_duchesse.id, subcategory_id: rock.id)
Tag.create!(event_id: lowpkin_duchesse.id, subcategory_id: electro.id)


karaoke_ribouldingue = Event.create!(
  venue_id: laribouldingue.id,
  date: DateTime.new(2022, 12, 21, 21),
  name: "Soirée Karaoké @la Ribouldingue",
  description: "Soirée Karaoké avec 32 000 titres au choix !! Venez pousser la chansonnette seul ou à plusieurs."
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/309468202_597912441864154_8070331872516526149_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=mnL2qeJnBLAAX_crd1J&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDwCR5lZXcq4DKeBsZgZK_DwfymCRZf1F75p5Bn-d2sDw&oe=6397AEAA")
karaoke_ribouldingue.photo.attach(io: file, filename: "karaoke_ribouldingue.jpg", content_type: "image/jpg")
karaoke_ribouldingue.save
Tag.create!(event_id: karaoke_ribouldingue.id, subcategory_id: karaoke.id)
Tag.create!(event_id: karaoke_ribouldingue.id, subcategory_id: chanson.id)

watticatch = Event.create!(
  venue_id: wattignies.id,
  date: DateTime.new(2022, 12, 12, 20),
  name: "Watti'catch #2",
  description: "Catch d'improvisation théâtrale par la compagnie CITO !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/316259455_603018394960854_4684816408502185807_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-7&_nc_sid=340051&_nc_ohc=wAdr265udjAAX9VMg2N&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBp_6rO3Jgq_WVfp7gQfg0Z1oQ3FbFWFG6mw-Sll3LD6A&oe=6396A900")
watticatch.photo.attach(io: file, filename: "watticatch.jpg", content_type: "image/jpg")
watticatch.save
Tag.create!(event_id: watticatch.id, subcategory_id: impro.id)
Tag.create!(event_id: watticatch.id, subcategory_id: caatch.id)

watticatch2 = Event.create!(
  venue_id: wattignies.id,
  date: DateTime.new(2023, 1, 16, 20),
  name: "Watti'catch #3",
  description: "Catch d'improvisation théâtrale par la compagnie CITO !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/316259455_603018394960854_4684816408502185807_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-7&_nc_sid=340051&_nc_ohc=wAdr265udjAAX9VMg2N&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBp_6rO3Jgq_WVfp7gQfg0Z1oQ3FbFWFG6mw-Sll3LD6A&oe=6396A900")
watticatch2.photo.attach(io: file, filename: "watticatch.jpg", content_type: "image/jpg")
watticatch2.save
Tag.create!(event_id: watticatch2.id, subcategory_id: impro.id)
Tag.create!(event_id: watticatch2.id, subcategory_id: caatch.id)

westsidecomedy = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2022, 12, 14, 20, 30),
  name: "WEST SIDE COMEDY CLUB",
  description: "LA soirée mythique du Stand-up à la Nantaise est de retour tous les MERCREDIS ! 🎤
  Venez profiter d'une ambiance unique dans un des lieux les plus cool de Nantes 🏴‍☠️🏴‍☠️🏴‍☠️.
  Entrée sur consommation🍻
  Sortie au Chapeau pour les artistes !🎩
  au Dock Yard, 21 quai des Antilles, dernier bar du Hangar à Bananes 🔥"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/305985993_487548553378166_1857861415412365221_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=340051&_nc_ohc=AHLkCiPhvjIAX8BjSGo&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAHFMsbwa7TuYgxFmvK1PNMGfJmdbieeglfah5WJ3ESFA&oe=63965D70")
westsidecomedy.photo.attach(io: file, filename: "westsidecomedy.jpg", content_type: "image/jpg")
westsidecomedy.save
Tag.create!(event_id: westsidecomedy.id, subcategory_id: stand_up.id)

westsidecomedy2 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2022, 12, 21, 20, 30),
  name: "WEST SIDE COMEDY CLUB",
  description: "LA soirée mythique du Stand-up à la Nantaise est de retour tous les MERCREDIS ! 🎤
  Venez profiter d'une ambiance unique dans un des lieux les plus cool de Nantes 🏴‍☠️🏴‍☠️🏴‍☠️.
  Entrée sur consommation🍻
  Sortie au Chapeau pour les artistes !🎩
  au Dock Yard, 21 quai des Antilles, dernier bar du Hangar à Bananes 🔥"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/305985993_487548553378166_1857861415412365221_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=340051&_nc_ohc=AHLkCiPhvjIAX8BjSGo&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAHFMsbwa7TuYgxFmvK1PNMGfJmdbieeglfah5WJ3ESFA&oe=63965D70")
westsidecomedy2.photo.attach(io: file, filename: "westsidecomedy2.jpg", content_type: "image/jpg")
westsidecomedy2.save
Tag.create!(event_id: westsidecomedy2.id, subcategory_id: stand_up.id)

micro_comedy_club = Event.create!(
  venue_id: microcomedyclub.id,
  date: DateTime.new(2022, 12, 10, 18),
  name: "Micro Comedy Club",
  description: "Venez découvrir le premier bar dédié au Stand-Up de Nantes !
  Pour se marrer autour d'un verre et passer une soirée avec les meilleurs humoristes Nantais.
  Tous les samedis, retrouvez 4 humoristes sur scène pour plus d'une heure de spectacle !
  🕰 Spectacles à 18H 00 - 19H 30 & 21H 00
  Tarif : 10€"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/302497982_484335717016304_1606536811189401311_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=5JTGB041TzMAX_4ooDo&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBO5n4aEivivLqtYVml7rbRsCahszZuW5GjmyPShxCTWQ&oe=63975732")
micro_comedy_club.photo.attach(io: file, filename: "micro_comedy_club.jpg", content_type: "image/jpg")
micro_comedy_club.save
Tag.create!(event_id: micro_comedy_club.id, subcategory_id: stand_up.id)

micro_comedy_club2 = Event.create!(
  venue_id: microcomedyclub.id,
  date: DateTime.new(2022, 12, 17, 18),
  name: "Micro Comedy Club",
  description: "Venez découvrir le premier bar dédié au Stand-Up de Nantes !
  Pour se marrer autour d'un verre et passer une soirée avec les meilleurs humoristes Nantais.
  Tous les samedis, retrouvez 4 humoristes sur scène pour plus d'une heure de spectacle !
  🕰 Spectacles à 18H 00 - 19H 30 & 21H 00
  Tarif : 10€"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/302497982_484335717016304_1606536811189401311_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=5JTGB041TzMAX_4ooDo&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBO5n4aEivivLqtYVml7rbRsCahszZuW5GjmyPShxCTWQ&oe=63975732")
micro_comedy_club2.photo.attach(io: file, filename: "micro_comedy_club.jpg", content_type: "image/jpg")
micro_comedy_club2.save
Tag.create!(event_id: micro_comedy_club2.id, subcategory_id: stand_up.id)

micro_comedy_club3 = Event.create!(
  venue_id: microcomedyclub.id,
  date: DateTime.new(2023, 1, 7, 18),
  name: "Micro Comedy Club",
  description: "Venez découvrir le premier bar dédié au Stand-Up de Nantes !
  Pour se marrer autour d'un verre et passer une soirée avec les meilleurs humoristes Nantais.
  Tous les samedis, retrouvez 4 humoristes sur scène pour plus d'une heure de spectacle !
  🕰 Spectacles à 18H 00 - 19H 30 & 21H 00
  Tarif : 10€"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/302497982_484335717016304_1606536811189401311_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=5JTGB041TzMAX_4ooDo&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBO5n4aEivivLqtYVml7rbRsCahszZuW5GjmyPShxCTWQ&oe=63975732")
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
  Tarif : 10€"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/302497982_484335717016304_1606536811189401311_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=5JTGB041TzMAX_4ooDo&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdt1-1.xx&oh=00_AfBO5n4aEivivLqtYVml7rbRsCahszZuW5GjmyPShxCTWQ&oe=63975732")
micro_comedy_club4.photo.attach(io: file, filename: "micro_comedy_club.jpg", content_type: "image/jpg")
micro_comedy_club4.save
Tag.create!(event_id: micro_comedy_club4.id, subcategory_id: stand_up.id)

malin_cab_brasdefer = Event.create!(
  venue_id: brasdefer.id,
  date: DateTime.new(2022, 12, 21, 20),
  name: "La Troupe du Malin @ Bras de Fer",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/311716209_550713573722018_6172132152094987707_n.jpg?stp=cp6_dst-jpg&_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=ssN7vxqBj4wAX-0ll5H&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAYfZyF1LIBPkCo3G7lpiYxbJ-JU6fP4yhXJalLKYjsVg&oe=63967FBB")
malin_cab_brasdefer.photo.attach(io: file, filename: "malin_cab_brasdefer.jpg", content_type: "image/jpg")
malin_cab_brasdefer.save
Tag.create!(event_id: malin_cab_brasdefer.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_brasdefer.id, subcategory_id: cabaret.id)

malin_cab_droledebarge = Event.create!(
  venue_id: droledebarge.id,
  date: DateTime.new(2023, 1, 4, 20),
  name: "La Troupe du Malin @Drôle de barge",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/313415027_565617375564971_6535321505116078799_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=340051&_nc_ohc=W_0NTK0k43cAX9w5IF8&_nc_ht=scontent-cdg2-1.xx&oh=00_AfDhRPJwo5r6PPWoGAME6zrE4OhOt5t3QEC3uiy_26_YSw&oe=63969584")
malin_cab_droledebarge.photo.attach(io: file, filename: "malin_cab_droledebarge.jpg", content_type: "image/jpg")
malin_cab_droledebarge.save

Tag.create!(event_id: malin_cab_droledebarge.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_droledebarge.id, subcategory_id: cabaret.id)

malin_cab_brasdefer2 = Event.create!(
  venue_id: brasdefer.id,
  date: DateTime.new(2023, 1, 18, 20),
  name: "La Troupe du Malin @ Bras de Fer",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/311716209_550713573722018_6172132152094987707_n.jpg?stp=cp6_dst-jpg&_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_ohc=ssN7vxqBj4wAX-0ll5H&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdg2-1.xx&oh=00_AfAYfZyF1LIBPkCo3G7lpiYxbJ-JU6fP4yhXJalLKYjsVg&oe=63967FBB")
malin_cab_brasdefer2.photo.attach(io: file, filename: "malin_cab_brasdefer.jpg", content_type: "image/jpg")
malin_cab_brasdefer2.save
Tag.create!(event_id: malin_cab_brasdefer2.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_brasdefer2.id, subcategory_id: cabaret.id)

malin_cab_droledebarge2 = Event.create!(
  venue_id: droledebarge.id,
  date: DateTime.new(2023, 2, 1, 20),
  name: "La Troupe du Malin @Drôle de barge",
  description: "Cabaret d'improvisation théâtrale par la Troupe du Malin !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/313415027_565617375564971_6535321505116078799_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=340051&_nc_ohc=W_0NTK0k43cAX9w5IF8&_nc_ht=scontent-cdg2-1.xx&oh=00_AfDhRPJwo5r6PPWoGAME6zrE4OhOt5t3QEC3uiy_26_YSw&oe=63969584")
malin_cab_droledebarge2.photo.attach(io: file, filename: "malin_cab_droledebarge.jpg", content_type: "image/jpg")
malin_cab_droledebarge2.save
Tag.create!(event_id: malin_cab_droledebarge2.id, subcategory_id: impro.id)
Tag.create!(event_id: malin_cab_droledebarge2.id, subcategory_id: cabaret.id)

lutins_cab_dockyard = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 1, 3, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/286762578_541832354024585_2375456894550697576_n.png?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=B0j5jQDDNK0AX8ulZZG&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdg2-1.xx&oh=00_AfClb8zqtL5FWghUmup7TJoY3H8fxPaXpgT2mnV1QVcK2w&oe=63964098")
lutins_cab_dockyard.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard.save
Tag.create!(event_id: lutins_cab_dockyard.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard.id, subcategory_id: cabaret.id)

lutins_cab_dockyard2 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 2, 7, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/286762578_541832354024585_2375456894550697576_n.png?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=B0j5jQDDNK0AX8ulZZG&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdg2-1.xx&oh=00_AfClb8zqtL5FWghUmup7TJoY3H8fxPaXpgT2mnV1QVcK2w&oe=63964098")
lutins_cab_dockyard2.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard2.save
Tag.create!(event_id: lutins_cab_dockyard2.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard2.id, subcategory_id: cabaret.id)

lutins_cab_dockyard3 = Event.create!(
  venue_id: dockyard.id,
  date: DateTime.new(2023, 3, 7, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @Dockyard !"
)
file = URI.open("https://scontent-cdg2-1.xx.fbcdn.net/v/t39.30808-6/286762578_541832354024585_2375456894550697576_n.png?_nc_cat=104&ccb=1-7&_nc_sid=e3f864&_nc_ohc=B0j5jQDDNK0AX8ulZZG&tn=VNipTtMvGQAjhius&_nc_ht=scontent-cdg2-1.xx&oh=00_AfClb8zqtL5FWghUmup7TJoY3H8fxPaXpgT2mnV1QVcK2w&oe=63964098")
lutins_cab_dockyard3.photo.attach(io: file, filename: "lutins_cab_dockyard.jpg", content_type: "image/jpg")
lutins_cab_dockyard3.save
Tag.create!(event_id: lutins_cab_dockyard3.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_dockyard3.id, subcategory_id: cabaret.id)

lutins_cab_ubik = Event.create!(
  venue_id: ubik.id,
  date: DateTime.new(2023, 1, 17, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @L'Ubik !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/311710559_634646788076474_6902129905020030725_n.png?stp=dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=RMhoE_4A6OsAX_ubkGC&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDvbV4x_tiwtce39jhQfcTOaPtiOSIaoypxweEAqhEecw&oe=6397CDE2")
lutins_cab_ubik.photo.attach(io: file, filename: "lutins_cab_ubik.jpg", content_type: "image/jpg")
lutins_cab_ubik.save
Tag.create!(event_id: lutins_cab_ubik.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_ubik.id, subcategory_id: cabaret.id)

lutins_cab_ubik2 = Event.create!(
  venue_id: ubik.id,
  date: DateTime.new(2023, 2, 21, 20, 30),
  name: "Le Cabaret des Lutins",
  description: "Cabaret d'improvisation théâtrale par Les Lutins Givrés @L'Ubik !"
)
file = URI.open("https://scontent-cdt1-1.xx.fbcdn.net/v/t39.30808-6/311710559_634646788076474_6902129905020030725_n.png?stp=dst-jpg&_nc_cat=106&ccb=1-7&_nc_sid=340051&_nc_ohc=RMhoE_4A6OsAX_ubkGC&_nc_ht=scontent-cdt1-1.xx&oh=00_AfDvbV4x_tiwtce39jhQfcTOaPtiOSIaoypxweEAqhEecw&oe=6397CDE2")
lutins_cab_ubik2.photo.attach(io: file, filename: "lutins_cab_ubik2.jpg", content_type: "image/jpg")
lutins_cab_ubik2.save
Tag.create!(event_id: lutins_cab_ubik2.id, subcategory_id: impro.id)
Tag.create!(event_id: lutins_cab_ubik2.id, subcategory_id: cabaret.id)


#fin seeds Julie################################################################################################################

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
Tag.create!(event_id: sven_dahu.id, subcategory_id: concert.id)
Tag.create!(event_id: sven_dahu.id, subcategory_id: world.id)

#seeds sewan tags

Tag.create!(event_id: livebar_standup.id, subcategory_id: stand_up.id)
Tag.create!(event_id: livebar_standup_deux.id, subcategory_id: stand_up.id)
Tag.create!(event_id: mononcle_standup.id, subcategory_id: stand_up.id)
Tag.create!(event_id: terrassedelile_cabaretdimpro.id, subcategory_id: cabaret.id)
Tag.create!(event_id: terrassedelile_cabaretdimpro.id, subcategory_id: impro.id)
Tag.create!(event_id: bam_blagues.id, subcategory_id: stand_up.id)
Tag.create!(event_id: belledejour_lundi.id, subcategory_id: stand_up.id)
Tag.create!(event_id: chatnoir_scene_ouverte.id, subcategory_id: jam_session.id)
Tag.create!(event_id: rondpointcafe_concert.id, subcategory_id: concert.id)
Tag.create!(event_id: rondpointcafe_concert.id, subcategory_id: electro.id)
Tag.create!(event_id: mojo_concert.id, subcategory_id: dj_set.id)

#fin seeds sewan tags

puts 'Tags done !'

puts 'Seeding done !'
