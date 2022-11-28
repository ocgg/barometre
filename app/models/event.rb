class Event < ApplicationRecord
  belongs_to :venue
  has_many :bookmarks
  has_many :subcategories
end
