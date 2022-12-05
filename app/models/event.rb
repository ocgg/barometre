class Event < ApplicationRecord
  belongs_to :venue
  has_many :bookmarks
  has_many :tags
  has_many :subcategories, through: :tags
  has_one_attached :photo
  has_many :users, through: :bookmarks

  # has_many :categories, through: :subcategories
  # accepts_nested_attributes_for :subcategories, :venue, :categories

  validates :venue, presence: true
  validates :name, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.yesterday }
  # validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :subcategory, presence: true
  # VALIDATION DATES
end
