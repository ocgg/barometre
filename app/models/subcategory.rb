class Subcategory < ApplicationRecord
  SUBCAT_THEATRE = ['Impro', 'Stand-up', 'Catch', 'Match', 'Cabaret']
  SUBCAT_MUSIQUE = ['Concert', 'DJ Set', 'Jam Session', 'Rock', 'Rap', 'World', 'Folk', 'Groove',
                    'Blind Test', 'Electro', 'Chanson', 'Slam', 'Karaoké', 'Jazz']
  SUBCATEGORIES = SUBCAT_THEATRE + SUBCAT_MUSIQUE

  belongs_to :category
  has_many :preferences
  has_many :events, through: :tags
  has_many :tags, dependent: :destroy

  validates :name, presence: true, inclusion: { in: SUBCATEGORIES }
  validates :category, presence: true
end
