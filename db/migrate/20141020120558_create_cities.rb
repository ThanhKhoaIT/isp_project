class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :country_id
      t.string :name
      t.float :position_x
      t.float :position_y

      t.timestamps
    end
  end
end
