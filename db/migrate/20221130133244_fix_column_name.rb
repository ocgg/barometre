class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :venues, :lat, :latitude
    rename_column :venues, :long, :longitude
  end
end
