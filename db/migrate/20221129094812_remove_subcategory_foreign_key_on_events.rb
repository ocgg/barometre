class RemoveSubcategoryForeignKeyOnEvents < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :events, column: :subcategory_id
  end
end
