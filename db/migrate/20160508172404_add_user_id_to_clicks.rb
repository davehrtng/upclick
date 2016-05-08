class AddUserIdToClicks < ActiveRecord::Migration
  def change
    add_column :clicks, :user_id, :integer
    add_index :clicks, :user_id
  end
end
