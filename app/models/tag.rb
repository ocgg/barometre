class Tag < ApplicationRecord
  belongs_to :event
  belongs_to :subcategory
end
