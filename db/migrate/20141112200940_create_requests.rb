class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.string :cities
      t.string :flights

      t.timestamps
    end
  end
end
