class AddConfirmedToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :confirmed, :boolean, default: false
  end
end
