class AddTypeToFlight < ActiveRecord::Migration
  def change
    add_column :flights, :type, :string
  end
end
