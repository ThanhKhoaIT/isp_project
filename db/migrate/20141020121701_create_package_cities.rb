class CreatePackageCities < ActiveRecord::Migration
  def change
    create_table :package_cities do |t|
      t.integer :package_id
      t.integer :city_id
      t.integer :step
      t.integer :total_days

      t.timestamps
    end
  end
end
