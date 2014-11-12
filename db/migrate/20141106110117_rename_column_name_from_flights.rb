class RenameColumnNameFromFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :city_form_id, :city_from_id
  end
end
