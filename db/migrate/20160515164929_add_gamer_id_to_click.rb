class AddGamerIdToClick < ActiveRecord::Migration
  def change
    add_column :clicks, :gamer_id, :integer
  end
end
