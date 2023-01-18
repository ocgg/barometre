# To be runned with rails db:scrap
namespace :db do
  desc "Scraps events from web"
  task scrap: :environment do
    load("db/scrap.rb")
  end
end
