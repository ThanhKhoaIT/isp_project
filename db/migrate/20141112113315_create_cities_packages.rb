class CreateCitiesPackages < ActiveRecord::Migration
  def change
    create_table :cities_packages do |t|
      t.integer :city_id
      t.integer :package_id

      t.timestamps
    end
  end
end
