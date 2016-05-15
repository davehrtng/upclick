class RemoveUserIdFromClick < ActiveRecord::Migration
  def change
    remove_column :clicks, :user_id, :integer
  end
end
