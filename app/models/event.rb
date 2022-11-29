class Event < ApplicationRecord
  belongs_to :venue
  has_many :bookmarks
  has_many :tags
  has_many :subcategories, through: :tags
  has_one_attached :photo

  validates :venue, presence: true
  validates :name, presence: true
  validates :date, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :subcategory, presence: true
end
