class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :preferences
  has_many :events

  validates :name, presence: true
  validates :category, presence: true
end
