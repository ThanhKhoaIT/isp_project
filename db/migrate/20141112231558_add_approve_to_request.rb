class AddApproveToRequest < ActiveRecord::Migration
  def change
    add_column :requests, :approved, :boolean, default: false
  end
end
