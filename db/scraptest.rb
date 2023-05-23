# test scrap
require "open-uri"
require "nokogiri"

subcat_theatre = ['Impro', 'Stand-up', 'Catch', 'Match', 'Cabaret']
subcat_music = ['Concert', 'DJ Set', 'Jam Session', 'Rock', 'Rap', 'World', 'Folk', 'Groove',
                'Blind Test', 'Electro', 'Chanson', 'Slam', 'Karaoké', 'Jazz', 'Métal', 'Blues']
subcats = subcat_theatre + subcat_music

# ouvre lien de la page venue sur Grabuge
html = URI.open("https://www.grabugemag.com/lieu/lune-froide/").read
doc = Nokogiri::HTML.parse(html)
elements = doc.search(".tribe-events-read-more")
array_parse = []
elements.each do |elem|
  array_parse << elem.attribute("href").value
end
event_test = array_parse.first(1)

# va ds le lien de chaque evenement de la venue pour scrapper
event_test.each do |url|
  evt = Nokogiri::HTML.parse(URI.open("#{url}").read)
  evt_name = evt.search(".tribe-events-single-event-title").children[0].text
  evt_venue = evt.search(".cmsmasters_event_meta_info_item_descr.author").children.text
  # venue = Venue.where("name LIKE ?", "%#{evt_venue}%")
  evt_day = evt.search(".tribe-events-abbr.updated.published.dtstart").attribute("title").value
  evt_hour = evt.search(".updated.published.time-details").text.strip.gsub("@ ", "").gsub("h", ":")
  evt_date = DateTime.parse("#{evt_day} #{evt_hour}", '%Y-%m-%d %H-%M')
  evt_tags = []
  evt_tags << evt.search(".tribe-event-tags").text.downcase
  evt_tags << evt.search(".cmsmasters_cat_color").text.downcase
  evt_desc = evt.search(".tribe-events-single-event-description").children.text
  evt_photo_url = evt.search(".attachment-cmsmasters-project-grid-thumb.wp-post-image").attribute("src").value
  p evt_venue
  # CREER L'OBJET EVENT
  # event = Event.new(
  #   name: evt_name,
  #   description: evt_desc,
  #   date: evt_date,
  #   venue: # Equivaut à: venue: venue
  # )
  # ATTACHER LA PHOTO
  # file = URI.open(evt_photo_url)
  # event.photo.attach(io: file, filename: "#{evt_date.strftime('%Y%m%d')}-#{venue.name.gsub(' ', '')}.jpg", content_type: "image/jpg")
  # event.confirmed = false
end
