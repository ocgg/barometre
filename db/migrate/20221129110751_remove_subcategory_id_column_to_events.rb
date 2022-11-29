class RemoveSubcategoryIdColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_reference :events, :subcategory, index: true, foreign_key: true
  end
end
