class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.string :name
      t.integer :city_id
      t.integer :star
      t.string :address

      t.timestamps
    end
  end
end
