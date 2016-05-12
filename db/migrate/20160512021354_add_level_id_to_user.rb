class AddLevelIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :level_id, :integer
  end
end
