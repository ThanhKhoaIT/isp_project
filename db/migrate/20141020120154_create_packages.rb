class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.string :discription
      t.float :total_amount
      t.float :discount
      t.integer :total_days

      t.timestamps
    end
  end
end
