class AddActiveAndTokenActiveToUser < ActiveRecord::Migration
  def change
    add_column :users, :active, :boolean
    add_column :users, :token_active, :string
  end
end
