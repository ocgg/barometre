class AddCoordinatesToVenues < ActiveRecord::Migration[7.0]
  def change
    add_column :venues, :lat, :float
    add_column :venues, :long, :float
  end
end
