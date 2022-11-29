class RemoveSubcategoryIdColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    remove_column :events, 'subcategory_id'
  end
end
