class Subcategory < ApplicationRecord
  SUBCATEGORIES = ['Impro', 'Stand-up', 'Catch', 'Match', 'Cabaret', 'Concert', 'DJ Set', 'Jam Session', 'Rock', 'Rap',
                   'World', 'Folk', 'Groove', 'Blind Test', 'Electro', 'Chanson', 'Slam', 'Karaoké', 'Jazz']
  belongs_to :category
  has_many :preferences
  has_many :events, through: :tags
  has_many :tags

  validates :name, presence: true, inclusion: { in: SUBCATEGORIES }
  validates :category, presence: true
end
