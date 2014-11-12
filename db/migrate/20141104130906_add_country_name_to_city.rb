class AddCountryNameToCity < ActiveRecord::Migration
  def change
    add_column :cities, :country_name, :string
  end
end
