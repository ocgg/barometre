class Category < ApplicationRecord
  const CATEGORIES = ['Concert', 'Jam Session', 'DJ set', 'Théatre', 'Divers']
  has_many :subcategories
  validates :name, presence: true, inclusion: { in: CATEGORIES }
end
