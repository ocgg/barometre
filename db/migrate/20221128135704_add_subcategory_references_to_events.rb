class AddSubcategoryReferencesToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :subcategory, null: false, foreign_key: true
  end
end
