class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :city_form
      t.integer :city_to
      t.float :price
      t.integer :total_hour

      t.timestamps
    end
  end
end
