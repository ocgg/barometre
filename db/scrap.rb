# PROBLEME :
# J'ai commencé à écrire ce fichier en pensant qu'il serait adaptable à tous les
# bars listés sur wik-nantes.fr... Mais au final il n'est utilisable que pour
# les évènements du Café Rouge Mécanique pour l'instant.

############# TODO: STRUCTURER CE FICHIER AVEC DES METHODES #############

# Ruby a besoin du nom des mois en anglais pour parser correctement les dates.
MONTHS = {
  "janvier" => "jan",
  "février" => "feb",
  "mars" => "mar",
  "avril" => "apr",
  "mai" => "may",
  "juin" => "jun",
  "juillet" => "jul",
  "août" => "aug",
  "septembre" => "sep",
  "octobre" => "oct",
  "novembre" => "nov",
  "décembre" => "dec"
}
subcat_theatre = ['Impro', 'Stand-up', 'Catch', 'Match', 'Cabaret']
subcat_music = ['Concert', 'DJ Set', 'Jam Session', 'Rock', 'Rap', 'World', 'Folk', 'Groove',
                'Blind Test', 'Electro', 'Chanson', 'Slam', 'Karaoké', 'Jazz', 'Métal', 'Blues']
subcats = subcat_theatre + subcat_music

puts "Scrapping 'Le Café Rouge Mécanique' events from wik-nantes.fr..."
venue = Venue.find_by(name: "Le Café Rouge Mécanique")
page = 0 # Les résultats s'affichent sur plusieurs pages sur wik

loop do
  # NOKOGIRI SETUP SUR L'INDEX DES EVENTS
  html = URI.open("https://www.wik-nantes.fr/domib44?page=#{page}")
  doc = Nokogiri::HTML(html)
  events = doc.search(".type-scene")
  # ARRETE LA BOUCLE S'IL N'Y A PLUS D'EVENTS A SCRAPPER
  break puts("Scrapping done for #{venue.name} !") if doc.at('.view-empty') || events.empty?

  events.each do |evt|
    # NOKOGIRI SETUP SUR LA SHOW DES EVENTS
    evt_url = "https://www.wik-nantes.fr#{evt.search('.views-field a')[0]['href']}"
    evt_html = URI.open(evt_url)
    evt_doc = Nokogiri::HTML(evt_html)

    # LE SCRAPPING SE PASSE ICI
    evt_name = evt_doc.at(".ctn-title h1").text.strip
    evt_photo_url = evt_doc.at(".ctn-img img")['src']
    evt_desc = evt_doc.search(".ctn-desc p").each do |p|
      break p.text.strip if p.text.strip.length > 10 # Pour assurer la validation de la description
    end

    evt_dates = evt_doc.search(".dates li").map { |date| date.text.strip.downcase }
    # REMPLACER LE NOM DES MOIS DANS LA DATE
    evt_dates.map! do |date|
      MONTHS.each { |k, v| break date.gsub!(k, v) if date.include?(k) }
      DateTime.parse(date)
    end

    evt_dates.each do |date|
      # NE RIEN FAIRE SI UN EVENT EXISTE DEJA LE MEME JOUR
      next puts("EVENT ALREADY EXISTS ON: #{date.strftime('%Y-%m-%d')}") if Event.where(venue:, date:).any?
      next puts("coucou") if date < Date.today

      # CREER L'OBJET EVENT
      event = Event.new(
        name: evt_name,
        description: evt_desc,
        date:, # Equivaut à: date: date,
        venue: # Equivaut à: venue: venue
      )
      # ATTACHER LA PHOTO
      file = URI.open(evt_photo_url)
      event.photo.attach(io: file, filename: "#{date.strftime('%Y%m%d')}-#{venue.name.gsub(' ', '')}.jpg", content_type: "image/jpg")
      event.confirmed = false
      # SAUVEGARDER L'EVENT DANS LA DB
      next puts("!ERROR! FOR: #{date.strftime('%Y-%m-%d')} - #{event.name}") unless event.save!

      puts "Added event: #{date.strftime('%Y-%m-%d')} - #{event.name}"
      # CREER LES TAGS
      evt_categ = evt_doc.at(".categ").text.downcase.strip
      subcats.each do |subcat|
        if evt_categ.include?(subcat.downcase) || evt_desc.downcase.include?(subcat.downcase)
          Tag.create!(event:, subcategory: Subcategory.find_by(name: subcat))
          puts "      - Tag linked: #{subcat}"
        end
      end
    end
  end
  page += 1
end
