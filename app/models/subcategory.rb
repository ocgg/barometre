class Subcategory < ApplicationRecord
  belongs_to :category
  has_many :preferences
  has_many :events
end
