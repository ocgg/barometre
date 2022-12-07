class Event < ApplicationRecord
  belongs_to :venue
  has_many :bookmarks, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :subcategories, through: :tags
  has_one_attached :photo
  has_many :categories, through: :subcategories
  has_many :users, through: :bookmarks

  # accepts_nested_attributes_for :subcategories, :venue, :categories

  validates :venue, presence: true
  validates :name, presence: true
  validates :date, presence: true, comparison: { greater_than: Date.yesterday }
  # validates :price, presence: true
  validates :description, presence: true, length: { minimum: 10 }
  # validates :subcategory, presence: true
  # VALIDATION DATES
end
