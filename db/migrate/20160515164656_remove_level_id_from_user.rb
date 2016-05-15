class RemoveLevelIdFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :level_id, :integer
  end
end
