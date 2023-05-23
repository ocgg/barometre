#test scrap
require "open-uri"
require "nokogiri"

subcat_theatre = ['Impro', 'Stand-up', 'Catch', 'Match', 'Cabaret']
subcat_music = ['Concert', 'DJ Set', 'Jam Session', 'Rock', 'Rap', 'World', 'Folk', 'Groove',
                'Blind Test', 'Electro', 'Chanson', 'Slam', 'Karaoké', 'Jazz', 'Métal', 'Blues']
subcats = subcat_theatre + subcat_music

#ouvre lien de la page venue sur Grabuge
html = URI.open("https://www.grabugemag.com/lieu/lune-froide/").read
doc = Nokogiri::HTML.parse(html)
elements = doc.search(".tribe-events-read-more")
array_parse = []
elements.each do |elem|
  array_parse << elem.attribute("href").value
end
event_test = array_parse.first(1)

#va ds le lien de chaque evenement de la venue
event_test.each do |url|
  evt = Nokogiri::HTML.parse(URI.open("#{url}").read)
  event_name = evt.search(".tribe-events-single-event-title").children[0].text
  event_day = evt.search(".tribe-events-abbr.updated.published.dtstart").attribute("title").value
  event_hour = evt.search(".updated.published.time-details").text.strip.gsub("@ ", "").gsub("h", ":")
  event_date = DateTime.parse("#{event_day} #{event_hour}", '%Y-%m-%d %H-%M')
  event_tags = []
  event_tags << evt.search(".tribe-event-tags").text.downcase
  event_tags << evt.search(".cmsmasters_cat_color").text.downcase
  event_desc = evt.search(".tribe-events-single-event-description").children.text
  event_photo_url = evt.search(".attachment-cmsmasters-project-grid-thumb.wp-post-image").attribute("src").value
  
end
