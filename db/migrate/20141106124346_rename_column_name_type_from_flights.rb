class RenameColumnNameTypeFromFlights < ActiveRecord::Migration
  def change
    rename_column :flights, :type, :type_use
  end
end
