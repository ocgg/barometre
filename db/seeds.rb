puts 'Seeding en cours...'

###### CHECKS (pour des seeds plus rapides) ####################################

categories_are_ok     = Category.all.map(&:name) == ['Musique', 'Théâtre']
subcategories_are_ok  = Subcategory.all.map(&:name).sort == Subcategory.all_subcategories.sort
venues_are_ok         = Venue.all.map(&:name).sort == [
  "Chat noir",
  "Jym",
  "Le Café Rouge Mécanique",
  "Le Zygo Bar",
  "Poum Poum T'chak",
  "Wattignies"
]

###### !!! L'ORDRE DES DESTROY_ALL EST IMPORTANT !!! ###########################

Tag.destroy_all
Bookmark.destroy_all
Event.destroy_all
Venue.destroy_all       unless venues_are_ok
Subcategory.destroy_all unless subcategories_are_ok
Category.destroy_all    unless categories_are_ok
User.destroy_all        unless User.all.any?

###### USERS ###################################################################

if User.all.any?
  puts 'Il y a déjà des Users. Rien à faire'
else
  print 'Création des Users...'

  User.create!(email: 'julie.tailleur@gmail.com', password: 'barometre', admin: true)
  User.create!(email: 'p.quignon.pro@gmail.com',  password: 'barometre', admin: true)
  User.create!(email: 'olivier.g@lavache.com',    password: 'barometre', admin: true)

  puts ' OK'
end

###### CATEGORIES ##############################################################

if categories_are_ok
  puts 'Les Categories sont à jour. Rien à faire'
else
  print 'Création des Categories...'

  Category.create!(name: 'Musique')
  Category.create!(name: 'Théâtre')

  puts ' OK'
end

###### SUBCATEGORIES ###########################################################

if subcategories_are_ok
  puts "Les Subcategories sont à jour. Rien à faire"
else
  print 'Création des Subcategories...'

  cat_musique = Category.find_by(name: 'Musique')
  cat_theatre = Category.find_by(name: 'Théâtre')

  ###### !!! EN CAS DE MODIFICATION !!! ######
  # Ne pas oublier de mettre à jour :
  #   - les checks au début du fichier
  #   - les constantes dans app/models/venue.rb

  # MUSIQUE
  [
    'Blind Test',
    'Blues',
    'Chanson',
    'Concert',
    'DJ Set',
    'Electro',
    'Folk',
    'Groove',
    'Jam Session',
    'Jazz',
    'Karaoké',
    'Métal',
    'Rock',
    'Rap',
    'Slam',
    'World'
  ].each { |name| Subcategory.create!(name:, category_id: cat_musique.id) }

  # THEATRE
  [
    'Cabaret',
    'Catch',
    'Impro',
    'Match',
    'Stand-up'
  ].each { |name| Subcategory.create!(name:, category_id: cat_theatre.id) }

  puts ' OK'
end

###### VENUES ##################################################################

# Ces lieux n'ont pas besoin d'être réels ou de matcher ceux de la DB de prod,
# ils sont là seulement pour tester en developpement.

if venues_are_ok
  puts 'Les Venues sont à jour. Rien à faire'
else
  print 'Création des Venues...'

  # EN CAS DE MODIFICATION :
  # Ne pas oublier de mettre à jour le check au début du fichier sur venues_are_ok
  venues_to_create = [
    { name: 'Jym',                      address: '2 Quai de Versailles, Nantes' },
    { name: 'Le Café Rouge Mécanique',  address: '10 rue bon secours, Nantes' },
    { name: "Poum Poum T'chak",         address: '19 rue du Chateau Nantes' },
    { name: 'Le Zygo Bar',              address: '35, rue des Olivettes, Nantes' },
    { name: 'Wattignies',               address: '13 Boulevard des Martyrs Nantais de la Résistance, Nantes' },
    { name: 'Chat noir',                address: '13, allée Duguay-TROUIN, Nantes' }
  ]

  venues_to_create.each do |data|
    # Création de la Venue
    venue = Venue.create!(data)

    # On attache la photo "bar" (fond de la home) et la confirmation
    venue.photo.attach(
      io: File.open('app/assets/images/image_home.jpg'),
      filename: "image_home.jpg",
      content_type: "image/jpg"
    )

    venue.confirmed = true
    venue.save!
  end

  puts ' OK'
end

###### EVENTS ##################################################################

print 'Création des Events...'

today_date  = Date.today.to_datetime
venue_ids   = Venue.all.map(&:id)

# today_date                #=> Aujourd'hui à 00h00
# today_date + 1r           #=> Aujourd'hui + 24h (= demain à 00h00)
# today_date + (20.5 / 24r) #=> Aujourd'hui à 20h30

events_to_create = [
  # Aujourd'hui
  {
    date: today_date + (20.5 / 24r),
    name: 'Ce soir : seul event avec une description !',
    description: "Ce truc est un truc qui se passe ce soir, et ça va être super si c'est encore l'heure"
  },

  # Demain
  { date: today_date + 1r   + (21   / 24r), name: 'Demaiiiin' },

  # Dans 4 jours
  { date: today_date + 4r   + (18.5 / 24r), name: 'Spectacle dans 4 jours !!' },
  { date: today_date + 4r   + (20   / 24r), name: 'Un autre truc le même jour' },

  # Dans 2 semaines
  { date: today_date + 14r  + (20.5 / 24r), name: 'Machin dans deux semaines' },

  # Dans 30 jours
  { date: today_date + 30r  + (21   / 24r), name: 'Evenement dans un mois' },

  # Dans 1 an
  { date: today_date + 365r + (19.5 / 24r), name: "Ça c'est dans 1 an" }
]

events_to_create.each do |data|
  # Création de l'Event en attribuant une Venue au pif
  event = Event.create!(data.merge(venue_id: venue_ids.sample))

  # On attache tous la photo "micro" (par défaut),
  # volontairement différente de celles des Venues
  event.photo.attach(
    io: File.open('app/assets/images/microbw.png'),
    filename: "microbw.png",
    content_type: "image/png"
  )

  event.confirmed = true
  event.save!

  ###### TAGS : ######

  # Choix d'une Category au hasard
  tag_category_id = Category.all.sample.id

  # On récolte les id des Subcategories correspondants à la Category sélectionnée
  tag_subcat_ids = Subcategory.where(category_id: tag_category_id).map(&:id)

  # On attache un nombre de tags au hasard :
  # Si c'est du théâtre, 1 ou 2, sinon, jusqu'à 5
  dice = rand(1..(tag_category_id == Category.find_by(name: 'Théâtre').id ? 2 : 5))

  # Enfin, on attache les tags au hasard
  dice.times do
    # Eviter les doublons grâce à pop
    tag_subcat_id = tag_subcat_ids.shuffle!.pop
    Tag.create!(
      event_id: event.id,
      subcategory_id: tag_subcat_id
    )
  end
end

puts ' OK'

puts 'Seeding terminé.'
