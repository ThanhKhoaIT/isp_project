class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :hotel_id
      t.float :price_per_day
      t.integer :maxi_people

      t.timestamps
    end
  end
end
