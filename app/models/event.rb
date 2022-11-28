class Event < ApplicationRecord
  belongs_to :venue
  has_many :bookmarks
  belongs_to :subcategory
  has_one_attached :photo
end
