class RemoveSubcategoryIdColumnToEvents < ActiveRecord::Migration[7.0]
  def change
    add_reference :events, :subcategory, foreign_key: true
    remove_reference :events, :subcategory, index: true, foreign_key: true
    # remove_column :events, :index_events_on_subcategory_id
  end
end
