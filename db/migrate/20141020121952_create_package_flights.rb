class CreatePackageFlights < ActiveRecord::Migration
  def change
    create_table :package_flights do |t|
      t.integer :package_id
      t.integer :flight_id
      t.float :price
      t.integer :total_hour

      t.timestamps
    end
  end
end
