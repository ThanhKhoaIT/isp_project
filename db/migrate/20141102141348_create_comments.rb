class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :package_id
      t.string :body
      t.integer :parent_comment_id
      t.integer :user_id

      t.timestamps
    end
  end
end
