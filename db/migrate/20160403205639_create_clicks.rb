class CreateClicks < ActiveRecord::Migration
  def change
    create_table :clicks do |t|

      t.timestamps null: false
    end
  end
end
