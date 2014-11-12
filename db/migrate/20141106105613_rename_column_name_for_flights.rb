class RenameColumnNameForFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :city_form, :city_form_id
    rename_column :flights, :city_to, :city_to_id
  end
end
