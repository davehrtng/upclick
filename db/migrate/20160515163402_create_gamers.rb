class CreateGamers < ActiveRecord::Migration
  def change
    create_table :gamers do |t|
      t.string :gamer_tag
      t.integer :level_id

      t.timestamps null: false
    end
  end
end
