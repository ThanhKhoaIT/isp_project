class AddImageToPackage < ActiveRecord::Migration
  def change
    add_column :packages, :image, :string
  end
end
