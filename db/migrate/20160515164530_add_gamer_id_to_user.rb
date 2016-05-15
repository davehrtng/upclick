class AddGamerIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :gamer_id, :integer
  end
end
