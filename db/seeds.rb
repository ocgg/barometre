require 'faker'

Faker::Config.locale = :fr

###### CHOIX DE L'UTILISATEUR ##################################################

puts "INFORMATIONS IMPORTANTES :"
puts "- Les Events créés seront répartis sur une période de 90 jours."
puts "- Environ 10% des Events ne seront pas confirmés."
puts "- Au delà de 30 objets, l'opération peut durer plus d'une minute."
puts ''
puts "Combien d'Events voulez-vous créer ?"
print '> '
events_number = gets.chomp.to_i
puts ''
puts "Combien de Venues voulez-vous créer ? (laisser vide pour les laisser en l'état)"
print '> '
venues_number = gets.chomp.to_i

if events_number.zero?
  puts "Réponse invalide : un nombre entier positif est requis."
  return
end

puts ''

###### CHECKS (pour des seeds un peu plus rapides) #############################

categories_are_ok     = Category.all.map(&:name) == ['Musique', 'Théâtre']
subcategories_are_ok  = Subcategory.all.map(&:name).sort == Subcategory.all_subcategories.sort

###### !!! L'ORDRE DES DESTROY_ALL EST IMPORTANT !!! ###########################

Tag.destroy_all
Bookmark.destroy_all
Event.destroy_all
# Venue.destroy_all       unless venues_are_ok
Venue.destroy_all       unless venues_number.zero?
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
  puts 'Les Categories sont conformes. Rien à faire'
else
  print 'Création des Categories...'

  Category.create!(name: 'Musique')
  Category.create!(name: 'Théâtre')

  puts ' OK'
end

###### SUBCATEGORIES ###########################################################

if subcategories_are_ok
  puts "Les Subcategories sont conformes. Rien à faire"
else
  print 'Création des Subcategories...'

  cat_musique = Category.find_by(name: 'Musique')
  cat_theatre = Category.find_by(name: 'Théâtre')

  ###### !!! EN CAS DE MODIFICATION !!! ######
  # Ne pas oublier de mettre à jour les constantes dans app/models/venue.rb

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

if venues_number.zero?
  puts "Vous avez choisi de laisser les Venues en l'état. Rien à faire"
else
  print "Création de #{venues_number} Venues..."

  # Récupération d'une adresse réelle avec l'API "adresse" du gouvernement
  # q=rue signifie qu'on recherche les résultats de la query : "rue"
  # 44109 => code INSEE de Nantes, la recherche est donc limitée à Nantes
  url = "http://api-adresse.data.gouv.fr/search?q=rue&limit=#{venues_number}&citycode=44109"

  # Extraction et stockage des adresses dans un array
  api_adresses = JSON.parse(URI.open(url).read)['features'].map do |data|
    data['properties']['label']
  end

  venues_number.times do
    venue = Venue.create!(
      name: Faker::Restaurant.name,
      description: Faker::Restaurant.description,
      address: api_adresses.shuffle!.pop
    )

    # Photo générée par Faker, avec le mot-clé "house", pour bien les
    # différencier de celles des Events.
    # La taille est volontairement petite pour accélerer les seeds
    venue_photo = URI.open(Faker::LoremFlickr.image(size: "40x40", search_terms: ['house']))
    venue_photo_filename = venue_photo.base_uri.to_s.match(%r{/([^/]+)\z})[1]

    venue.photo.attach(
      io: venue_photo,
      filename: venue_photo_filename
    )

    venue.confirmed = true
    venue.save!
  end

  puts ' OK'
end

###### EVENTS ##################################################################

print "Création de #{events_number} Events..."

today_date  = Date.today.to_datetime
venue_ids   = Venue.all.map(&:id)

# today_date                #=> Aujourd'hui à 00h00
# today_date + 1r           #=> Aujourd'hui + 24h (= demain à 00h00)
# today_date + (20.5 / 24r) #=> Aujourd'hui à 20h30

events_number.times do
  event = Event.create!(
    name: Faker::Lorem.words(number: rand(2..8)).join(' ').capitalize,
    date: today_date + rand(0..90) + (rand(17..23) / 24r),
    description: Faker::Lorem.paragraph(sentence_count: rand(1..10)),
    # Attribution d'une Venue au hasard
    venue_id: venue_ids.sample
  )

  # Photo générée par Faker avec le mot clé "music"
  # La taille est volontairement petite pour accélerer les seeds
  evt_photo = URI.open(Faker::LoremFlickr.image(size: "40x40", search_terms: ['music']))
  evt_photo_filename = evt_photo.base_uri.to_s.match(%r{/([^/]+)\z})[1]

  event.photo.attach(
    io: evt_photo,
    filename: evt_photo_filename
  )

  # Avoir une proportion d'environ 10% d'events non confirmés
  event.confirmed = true if rand(0..100) > 10
  event.save!

  ###### TAGS : ######

  # Choix d'une Category au hasard
  tag_category_id = Category.all.sample.id

  # id des Subcategories correspondants à la Category sélectionnée
  tag_subcat_ids = Subcategory.where(category_id: tag_category_id).map(&:id)

  # Déclarer un nombre de tags au hasard : 1 ou 2 pour du Théâtre, sinon 1 à 5
  dice = rand(1..(tag_category_id == Category.find_by(name: 'Théâtre').id ? 2 : 5))

  # Sélection des tags au hasard, éviter les doublons avec .pop
  dice.times do
    tag_subcat_id = tag_subcat_ids.shuffle!.pop
    Tag.create!(
      event_id: event.id,
      subcategory_id: tag_subcat_id
    )
  end
end

puts ' OK'

puts 'Seeding terminé.'
