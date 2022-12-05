class Category < ApplicationRecord
  CATEGORIES = ['Théâtre', 'Musique']
  has_many :subcategories
  validates :name, presence: true, inclusion: { in: CATEGORIES }
end
